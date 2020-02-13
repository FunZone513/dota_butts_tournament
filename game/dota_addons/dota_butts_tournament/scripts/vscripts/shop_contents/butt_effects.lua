ButtEffects = class({})
ButtEffects.const = SETTINGS.BUTT_EFFECTS

--=================================================================================================

ButtEffects.Exploding = {}

function ButtEffects:MakeTeamExplodeOnDeath( teamNumber )
	if not self.Exploding[teamNumber] then
		self.Exploding[teamNumber] = true
	end

	GameRules:GetGameModeEntity():SetContextThink( "ExplodeDuration"..teamNumber, function()
		self.Exploding[teamNumber] = false
	end, self.const.EXPLODE_ON_DEATH_DURATION )
end

ListenToGameEvent( "entity_killed", function(event)
	local unit = EntIndexToHScript( event.entindex_killed )
	if unit and ButtEffects.Exploding[ unit:GetTeamNumber() ] == true then
		
		-- Explode
		local damage = unit:GetMaxHealth() * ButtEffects.const.EXPLODE_DAMAGE_MULTIPLIER
		local radius = unit:GetMaxHealth() * ButtEffects.const.EXPLODE_AOE_MULTIPLIER

		local tTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
		if ButtEffects.const.EXPLODE_FRIENDLY_FIRE then tTeam = DOTA_UNIT_TARGET_TEAM_BOTH end

		local damage_table = {
			victim = "place_holder",
        	attacker = unit,
        	damage = damage,
        	ability = nil,
        	damage_type = ButtEffects.const.EXPLODE_DAMAGE_TYPE
		}

		local enemies = FindUnitsInRadius(
			unit:GetTeamNumber(),	-- int, your team number
			unit:GetAbsOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit
			radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			tTeam,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,	-- int, type filter
			DOTA_UNIT_TARGET_FLAG_NONE,	-- int, flag filter
			FIND_ANY_ORDER,	-- int, order filter
			false	-- bool, can grow cache
		)

		for _,target in ipairs(enemies) do
			damage_table.victim = target
			ApplyDamage(damage_table)
		end

		local effect = ParticleManager:CreateParticle( "particles/units/heroes/hero_techies/techies_blast_off.vpcf", PATTACH_WORLDORIGIN, unit )
   		ParticleManager:SetParticleControl( effect, 0, unit:GetAbsOrigin() )
   		EmitSoundOn("Hero_Techies.Suicide", unit)

	end
end, nil)

--=================================================================================================

function ButtEffects:RemoveTrees()
	if ButtEffects.const.REMOVE_TREE_RADIUS == "everywhere" then 
		GridNav:DestroyTreesAroundPoint( Vector(0,0,0), 20000, false )
	else
		GridNav:DestroyTreesAroundPoint( Vector(0,0,0), ButtEffects.const.REMOVE_TREE_RADIUS, false )
	end
end

--=================================================================================================

ButtEffects.CreepHeroes = {}
ButtEffects.AbilityList = require('shop_contents/creep_heroes/ability_list')
ButtEffects.creepHeroDebugNumber = 0
ButtEffects.creepHeroDebugType = ButtEffects.AbilityList.regular

LinkLuaModifier( "creep_hero_ai", "shop_contents/creep_heroes/creep_hero_ai", LUA_MODIFIER_MOTION_NONE )

function ButtEffects:BeginCreepHeroes( teamNumber )
	if not self.CreepHeroes[teamNumber] then
		self.CreepHeroes[teamNumber] = self.const.CREEP_HEROES_WAVE_COUNT
	else
		self.CreepHeroes[teamNumber] = self.CreepHeroes[teamNumber] + self.const.CREEP_HEROES_WAVE_COUNT
	end
end

ListenToGameEvent( "npc_spawned", function(event)
	if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then return end

	local unit = EntIndexToHScript(event.entindex)
	local teamNumber = unit:GetTeamNumber()

	if ButtEffects.CreepHeroes[teamNumber] and ButtEffects.CreepHeroes[teamNumber] > 0 then

		GameRules:GetGameModeEntity():SetContextThink( "CreepWaveTimer"..teamNumber, function()
			ButtEffects.CreepHeroes[teamNumber] = ButtEffects.CreepHeroes[teamNumber]-1
		end, 5 )

		local check = false
  		if unit:GetUnitName():find("melee") and unit:GetUnitName():find("creep") then
  			if not ButtEffects.const.CREEP_HEROES_DEBUG_MODE then
				ButtEffects:GiveCreepHeroAbility( unit, false )
			else check = true end

    	elseif unit:GetUnitName():find("ranged") and unit:GetUnitName():find("creep") then
      		if not ButtEffects.const.CREEP_HEROES_DEBUG_MODE then
      			ButtEffects:GiveCreepHeroUltimate( unit, false )
      		else check = true end

    	elseif unit:GetUnitName():find("siege") then
    		if not ButtEffects.const.CREEP_HEROES_DEBUG_MODE then
   				ButtEffects:GiveCreepHeroUltimate( unit, true )
    			ButtEffects:GiveCreepHeroAbility( unit, true )
    		else check = true end
   		end
   		if check then ButtEffects:DebugAbilities(unit) end
   	end
end, nil )

function ButtEffects:GiveCreepHeroAbility( creep, bSiege )
    local amount = ButtEffects.const.CREEP_HEROES_ABILITY_COUNT
    local level = ButtEffects.const.CREEP_HEROES_ABILITY_LEVEL
	if bSiege then amount = math.ceil(amount/2) end
	
	for i=1, amount do
		local chosen_ability
    	repeat chosen_ability = ButtEffects.AbilityList.regular[RandomInt(1, #(ButtEffects.AbilityList.regular))] until not creep:HasAbility(chosen_ability)

       	local ability = creep:AddAbility(chosen_ability)
       	ability:SetLevel( level )
       	if ability:IsHidden() then ability:SetHidden(false) end
       	end
   	if not creep:HasModifier("creep_hero_ai") then creep:AddNewModifier(creep, nil, "creep_hero_ai", {}) end
end

function ButtEffects:GiveCreepHeroUltimate( creep, bSiege )
	local amount = math.ceil( ButtEffects.const.CREEP_HEROES_ULTIMATE_COUNT)
    local level = math.min( 3, ButtEffects.const.CREEP_HEROES_ABILITY_LEVEL )
	if bSiege then amount = math.ceil(amount/2) end

	for i=1, amount do
    	local chosen_ability
    	repeat chosen_ability = ButtEffects.AbilityList.ultimate[RandomInt(1, #(ButtEffects.AbilityList.ultimate))] until not creep:HasAbility(chosen_ability)
    	
       	local ability = creep:AddAbility(chosen_ability)
       	ability:SetLevel( level )
       	if ability:IsHidden() then ability:SetHidden(false) end
   	end
   	if not creep:HasModifier("creep_hero_ai") then creep:AddNewModifier(creep, nil, "creep_hero_ai", {}) end
end

function ButtEffects:DebugAbilities(creep)
	self.creepHeroDebugNumber = self.creepHeroDebugNumber+1

	if #self.AbilityList.debug > 0 then
		if self.creepHeroDebugNumber > #self.AbilityList.debug then 
			self.CreepHeroes[creep:GetTeamNumber()] = 0
			print("SUCCESSFULLY APPLIED ALL DEBUG ABILITIES")
			return nil
		end
		local ability = creep:AddAbility( self.AbilityList.debug[ self.creepHeroDebugNumber ] )
		ability:SetLevel( ability:GetMaxLevel() )
		if not creep:HasModifier("creep_hero_ai") then creep:AddNewModifier(creep, nil, "creep_hero_ai", {}) end
		return nil

	elseif self.creepHeroDebugNumber > #self.creepHeroDebugType then
		self.creepHeroDebugNumber = 1
		if self.creepHeroDebugType ~= self.AbilityList.ultimate then
			self.creepHeroDebugType = self.AbilityList.ultimate
		else
			self.CreepHeroes[creep:GetTeamNumber()] = 0
			print("SUCCESSFULLY APPLIED ALL CURRENT ABILITIES")
			return nil
		end
	end

	local ability = creep:AddAbility( self.creepHeroDebugType[ self.creepHeroDebugNumber ] )
	ability:SetLevel( ability:GetMaxLevel() )
	if not creep:HasModifier("creep_hero_ai") then creep:AddNewModifier(creep, nil, "creep_hero_ai", {}) end
end

--=================================================================================================
