local alliedFlagFilter = DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES + -- we want allies to be affected
  DOTA_UNIT_TARGET_FLAG_NO_INVIS + -- we don't want to give away invisible allies
  DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS -- ancients are (probably) unaffected by abilities

local enemyFlagFilter = DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + -- not away from our sight
  DOTA_UNIT_TARGET_FLAG_NO_INVIS + -- don't cheat - allies should not see invisible TODO: what about revealed enemies?
  DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS + -- ancients are (probably) unaffected by abilities
  DOTA_UNIT_TARGET_FLAG_NOT_NIGHTMARED -- why interrupt nightmare if it causes only problems?

local enemyDetectRange = ButtEffects.const.CREEP_HEROES_ENEMY_DETECT_RANGE

local healthToCast = ButtEffects.const.CREEP_HEROES_HEALTH_PERCENT_TO_CAST
local function isHealthLow( caster )
  local health_percent = ( (caster:GetMaxHealth()-(caster:GetMaxHealth() - caster:GetHealth())) / caster:GetMaxHealth()) * 100
  return health_percent <= healthToCast
end

local function debugPrint(caster,ability,lowHP)
  if not ButtEffects.const.CREEP_HEROES_DEBUG_MODE then return end
  local time = GameRules:GetDOTATime(false,false)..""
  local s = ""
  local count = 1
  repeat 
    s = string.sub(time, count, count)
    count=count+1
  until s == "."
  time = string.sub(time, 1, count)
  if not lowHP then
    print(time, "About to cast " .. ability:GetAbilityName())
  else
    print(time, "Low Health cast " .. ability:GetAbilityName())
  end
end

-- FindUnitsInRadius with flags for allies
local function detectAllies(caster, radius, sorted)
  local order_flag = FIND_ANY_ORDER
  if sorted then order_flag = FIND_FARTHEST end
  return FindUnitsInRadius(
    caster:GetTeamNumber(), -- your team number
    caster:GetAbsOrigin(), -- position to search from
    nil, -- cache unit
    radius, -- radius
    DOTA_UNIT_TARGET_TEAM_FRIENDLY, -- team filter
    DOTA_UNIT_TARGET_ALL - DOTA_UNIT_TARGET_BUILDING, -- type filter; all entities that can belong to a team, so all except trees
    alliedFlagFilter, -- flag filter,
    order_flag, -- find order
    false
  )
end

-- FindUnitsInRadius with flags for visible enemies
local function detectEnemies(caster, radius, sorted)
  local order_flag = FIND_ANY_ORDER
  if sorted then order_flag = FIND_FARTHEST end
  return FindUnitsInRadius(
    caster:GetTeamNumber(), -- your team number
    caster:GetAbsOrigin(), -- position to search from
    nil, -- cache unit
    radius, -- radius
    DOTA_UNIT_TARGET_TEAM_ENEMY, -- team filter
    DOTA_UNIT_TARGET_ALL - DOTA_UNIT_TARGET_BUILDING, -- type filter; all entities that can belong to a team, so all except trees
    enemyFlagFilter, -- flag filter,
    order_flag,
    false -- can grow cache
  )
end

-- Decide whether creep should cast a no target spell by checking for enemies and / or allies around. 
local function GetNoTargetDecision(caster)
  -- Check if there's anyone to affect
    local anyEnemies = false
    local anyAllies = false
    local alliedUnits = detectAllies(caster, enemyDetectRange / 2)
    local enemyUnits = detectEnemies(caster, math.ceil(enemyDetectRange * 0.7))
    for _,unit in pairs(alliedUnits) do
      if unit ~= caster then
        anyAllies = true
        break
      end
    end
    for _,unit in pairs(enemyUnits) do
      anyEnemies = true
      break
    end
    -- Decide whether to cast or not
    local decision = false
    if anyEnemies then
      if anyAllies then
        decision = true
      elseif RandomFloat(0., 1.) < 0.5 then
        decision = true
      end
    end
    if isHealthLow(caster) then decision = true end
    return decision
end

-- Creep got a spell target. Now randomly decide whether to cast the spell, the alternative being skipping to next target.
local function GetTargetDecision()
  return RandomFloat(0.,1.) < 0.95
end

local strategies = {
  NoTarget = function(caster, ability)
    local decision = GetNoTargetDecision(caster)
    -- Cast (or don't)
    if decision then
      debugPrint(caster,ability)
      caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
    end
    
    return decision
  end,
  
  UnitTarget = function (caster, ability)
    if not isHealthLow(caster) then 
      if #detectEnemies(caster, enemyDetectRange) < 1 then return false end
    end
    local range = ability:GetCastRange()
    if range <= 0 then range = FIND_UNITS_EVERYWHERE end
    local targets = FindUnitsInRadius(
      caster:GetTeamNumber(), -- your team number
      caster:GetAbsOrigin(), -- position to search from
      nil, -- cache unit
      range, -- radius
      ability:GetAbilityTargetTeam(), -- team filter
      ability:GetAbilityTargetType(), -- type filter
      bit.bor(ability:GetAbilityTargetFlags(), DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE), -- flag filter 
      FIND_FARTHEST, -- prefer farthest target instead of random order
      false -- can grow cache
    )
    if not targets then return false end
    for _, unit in pairs(targets) do
      if (not unit:IsUnselectable()) and GetTargetDecision() then
        caster:SetCursorCastTarget(unit)
        debugPrint(caster,ability)
        caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
        return true
      end
    end
    return false
  end,
  
  PointTarget = function (caster, ability)
    if not isHealthLow(caster) then 
      if #detectEnemies(caster, enemyDetectRange) < 1 then return false end
    end
    local range = ability:GetCastRange()
    if range <= 0 then range = FIND_UNITS_EVERYWHERE end
    local targets = detectEnemies(caster, range, true)
    if targets then
      for _, unit in pairs(targets) do
        if GetTargetDecision() then
          caster:SetCursorPosition(unit:GetAbsOrigin())
          debugPrint(caster,ability)
          caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
          return true
        end
      end
    elseif isHealthLow(caster) then
      caster:SetCursorPosition( caster:GetOrigin() + RandomVector( RandomInt(0, range) ) )
      caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
      debugPrint(caster,ability,true)
      return true
    end
    return false
  end,
  
  AOEPointTarget = function (caster, ability)
    if not isHealthLow(caster) then 
      if #detectEnemies(caster, enemyDetectRange) < 1 then return false end
    end
    local range = ability:GetCastRange()
    if range <= 0 then range = FIND_UNITS_EVERYWHERE end
    local targets = detectEnemies(caster, range, true)
    local candidate = nil
    local best_score = 0
    local attempts_left = 3
    for _, unit in pairs(targets) do
      local enemyCount = #detectEnemies(caster, 300., true)
      local allyCount = #detectAllies(caster, 300., true)
      local score = enemyCount + 0.4*allyCount
      if score > best_score then
        candidate = unit
        best_score = score
      end
      attempts_left = attempts_left - 1
      if attempts_left <= 0 then break end
    end
    if candidate then
      caster:SetCursorPosition(candidate:GetAbsOrigin())
      debugPrint(caster,ability)
      caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
      return true
    elseif isHealthLow(caster) then
      caster:SetCursorPosition( caster:GetOrigin() + RandomVector( RandomInt(0, range) ) )
      debugPrint(caster,ability,true)
      caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
      return true
    end
    return false
  end,
  
  Toggle = function (caster, ability)
    local decision = GetNoTargetDecision(caster)
    if decision and (not ability:GetToggleState()) then
      --print(string.sub(tostring(GameRules:GetDOTATime(false, false), 1, 2)), "Toggling on: " .. ability:GetAbilityName())
      ability:ToggleAbility()
    end
    if (not decision) and ability:GetToggleState() then
      --print(string.sub(tostring(GameRules:GetDOTATime(false, false), 1, 2)), "Toggling off: " .. ability:GetAbilityName())
      ability:ToggleAbility()
    end
  end,
}

return strategies