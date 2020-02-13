-- Makes the designated team's units start to explode when killed
ButtEffects:MakeTeamExplodeOnDeath( int teamNumber )

-- Removes all the trees on the map
ButtEffects:RemoveTrees()

-- Makes it so that the team's lane creeps spawn with hero abilities
ButtEffects:BeginCreepHeroes( int teamNumber )
	ButtEffects:GiveCreepHeroAbility( handle creep, bool bSiege ) -- Gives the unit regular abilities
	ButtEffects:GiveCreepHeroUltimate( handle creep, bool bSiege ) -- Gives the unit ultimate abilities
