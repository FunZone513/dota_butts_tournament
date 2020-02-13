creep_hero_ai = class({})
function creep_hero_ai:IsHidden() return true end
function creep_hero_ai:IsPurgable() return true end
function creep_hero_ai:RemoveOnDeath() return true end

function creep_hero_ai:DeclareFunctions() return { MODIFIER_PROPERTY_MANACOST_PERCENTAGE } end
function creep_hero_ai:GetModifierPercentageManacost() return 100 end

if IsServer() then
	local casting_strategies = require('shop_contents/creep_heroes/casting_strategies')

	function creep_hero_ai:OnCreated()
		self.cast_list = {}

		for i=0,self:GetParent():GetAbilityCount()-1 do
    		local ability = self:GetParent():GetAbilityByIndex(i)
    		if ability then	self:AddToList( ability ) end
    	end

    	self:StartIntervalThink( 1 )

	end

	function creep_hero_ai:OnIntervalThink()
    	if self:GetParent():IsUnselectable() then return end

  		local cast_ability = false
  		local unit = self:GetParent()
  		local cooldown = 1e9

  		if (not unit:IsCommandRestricted()) and (not unit:IsHexed()) and (not unit:IsSilenced()) and (not unit:IsStunned()) and (not unit:IsOutOfGame()) then
    		for _,abilityInfo in pairs( self.cast_list ) do
      			if not cast_ability then
      				if abilityInfo.ability:IsFullyCastable() then
        				cast_ability = abilityInfo.cast_type(unit, abilityInfo.ability)
        				if cast_ability and ButtEffects.const.CREEP_HEROES_DEBUG_MODE then self:GetParent():ForceKill(false) end
        			end
      			end

      			cooldown = math.min( cooldown, abilityInfo.ability:GetCooldownTimeRemaining() )
    		end
  		end

  		local idle_time = ButtEffects.const.CREEP_HEROES_IDLE_TIME
  		local idle = RandomInt( idle_time[1] , idle_time[2])
  		if (not cast_ability) or (cooldown < idle ) then
    		cooldown = idle
  		end
  		self:StartIntervalThink(cooldown)
	end

	function creep_hero_ai:AddToList( inputAbility )
		if bit.band(inputAbility:GetBehavior(), DOTA_ABILITY_BEHAVIOR_PASSIVE) > 0 then return nil end

		local abilityInfo = {
			ability = inputAbility,
			cast_type = casting_strategies.UnitTarget
		}

    	if bit.band(inputAbility:GetBehavior(), DOTA_ABILITY_BEHAVIOR_TOGGLE) > 0 then
      		abilityInfo.cast_type = casting_strategies.Toggle

   		elseif bit.band(inputAbility:GetBehavior(), DOTA_ABILITY_BEHAVIOR_NO_TARGET) > 0 then
   			abilityInfo.cast_type = casting_strategies.NoTarget

   		elseif bit.band(inputAbility:GetBehavior(), DOTA_ABILITY_BEHAVIOR_POINT) > 0 then
			if bit.band(inputAbility:GetBehavior(), DOTA_ABILITY_BEHAVIOR_AOE) > 0 then
       			abilityInfo.cast_type = casting_strategies.AOEPointTarget
   			else
        		abilityInfo.cast_type = casting_strategies.PointTarget
      		end
    	end

    	table.insert( self.cast_list, abilityInfo )
	end

end