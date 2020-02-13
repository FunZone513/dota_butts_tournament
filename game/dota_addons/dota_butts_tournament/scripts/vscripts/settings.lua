SETTINGS = {
	BUTT_EFFECTS = {
		EXPLODE_ON_DEATH_DURATION = 300, -- time in seconds
		EXPLODE_DAMAGE_MULTIPLIER = 1, -- Multiplied to the units max hp for damage. ie; 1.5 is 1.5x the units maxhp as damage
		EXPLODE_AOE_MULTIPLIER = 0.5, -- Same as damage, but for the aoe radius instead
		EXPLODE_DAMAGE_TYPE = DAMAGE_TYPE_PHYSICAL, -- DAMAGE_TYPE_PHYSICAL, DAMAGE_TYPE_MAGICAL, DAMAGE_TYPE_PURE
		EXPLODE_FRIENDLY_FIRE = true, -- bool, if units should damage thier team mates with their explosion

		REMOVE_TREE_RADIUS = "everywhere", -- int radius or cString "everywhere" // "everywhere" is just 20k units 

		CREEP_HEROES_DEBUG_MODE = false, -- gives out each ability at a time to find crashes
		CREEP_HEROES_WAVE_COUNT = 3, -- number of creep waves to grant abilities to
		CREEP_HEROES_ABILITY_COUNT = 4, -- number of regular abilities to give to melee creeps, sieges get half (rounded up)
		CREEP_HEROES_ULTIMATE_COUNT = 2, -- number of ultimates to give to ranged creeps, sieges get half (rounded up)
		CREEP_HEROES_ABILITY_LEVEL = 4, -- for both regular and ultimate abilities, 4 just defaults to max for both
		CREEP_HEROES_IDLE_TIME = { 2, 6 }, -- { min, max } // Basically the time in seconds between casting abilities
		CREEP_HEROES_HEALTH_PERCENT_TO_CAST = 30, -- if the creep has less than this % health then they'll just cast their point target or no target abilities anyway
		CREEP_HEROES_ENEMY_DETECT_RANGE = 1200, -- if there is an enemy within this range of the unit then it will start trying to cast abilities
	},

	BUFFS = {
		LOOTING_MULTIPLIER = 2,

		EMERGENCY_TRAINING_MULTIPLIER = 2,

		CHARGE_MOVESPEED = 100, -- flat movespeed increase
		CHARGE_FREE_PATHING = true, -- unobstructed movement, like flying movement
		--CHARGE_NO_CAP = true, [ No clean way to have it show client, for now its hardcoded as true ]

		IRON_WALL_ARMOUR = 30,
		IRON_WALL_MR = 30, -- %
	}
}