if ButtTournament == nil then
	ButtTournament = class({})
end

require('settings')
require('shop_contents/butt_effects')

function Precache( context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_techies.vsndevts", context )
end

function Activate()
	GameRules.AddonTemplate = ButtTournament()
	GameRules.AddonTemplate:InitGameMode()

	-- Debug / Testing stuff
	---=======================================================
	ListenToGameEvent( "npc_spawned", function(event)
		local unit = EntIndexToHScript(event.entindex)
		if unit:IsRealHero() then
			--LinkLuaModifier("modifier_iron_wall", "shop_contents/shop_buffs.lua", LUA_MODIFIER_MOTION_NONE)
			--unit:AddNewModifier(unit, nil, "modifier_iron_wall", {})

			--ButtEffects:RemoveTrees()
			--ButtEffects:MakeTeamExplodeOnDeath( unit:GetTeamNumber() )
			--ButtEffects:BeginCreepHeroes( unit:GetTeamNumber() )
		end
	end, nil)
	---=======================================================
end

function ButtTournament:InitGameMode()
	GameRules:GetGameModeEntity():SetModifyGoldFilter( self.ModifyGoldFilter, self )
	GameRules:GetGameModeEntity():SetModifyExperienceFilter( self.ModifyExpFilter, self )
end

-- Filters
function ButtTournament:ModifyGoldFilter( event )

	local hero = event.player_id_const and PlayerResource:GetSelectedHeroEntity( event.player_id_const )
    if hero and hero:HasModifier("modifier_looting") then
    	print(event.gold)
    	event.gold = event.gold * SETTINGS.BUFFS.LOOTING_MULTIPLIER
    end

    return true
end

function ButtTournament:ModifyExpFilter( event )

	local hero = event.hero_entindex_const and EntIndexToHScript( event.hero_entindex_const )
    if hero and hero:HasModifier("modifier_emergency_training") then
    	print(event.experience)
    	event.experience = event.experience * SETTINGS.BUFFS.EMERGENCY_TRAINING_MULTIPLIER
    end

    return true
end