local ability_listing = {
  regular = {
    "abaddon_death_coil",
    "abaddon_aphotic_shield",
    --"abaddon_frostmourne", --Doesn't stick the buffs as it should
    "abyssal_underlord_firestorm",
    "abyssal_underlord_pit_of_malice",
    "abyssal_underlord_atrophy_aura",
    "alchemist_acid_spray",
    "antimage_mana_break",
    "antimage_blink",
    "antimage_counterspell", -- NEW
    "ancient_apparition_cold_feet",
    "ancient_apparition_ice_vortex",
    "ancient_apparition_chilling_touch",
    "arc_warden_flux",
    "arc_warden_magnetic_field",
    "arc_warden_spark_wraith",
    "axe_berserkers_call",
    "axe_battle_hunger",
    "bane_enfeeble",
    "bane_brain_sap",
    "bane_nightmare",
    "batrider_sticky_napalm",
    "batrider_flamebreak",
    "batrider_firefly",
    "beastmaster_wild_axes",
    --"beastmaster_call_of_the_wild",
    "beastmaster_call_of_the_wild_boar", --it stinks / NEW
    "beastmaster_call_of_the_wild_hawk", --it stinks / NEW
    "beastmaster_inner_beast", 
    "bloodseeker_bloodrage",
    "bloodseeker_blood_bath",
    "bloodseeker_thirst", -- VERIFIED: NO CRASH
    "bounty_hunter_shuriken_toss",
    --"bounty_hunter_jinada", --Crashes the game upon attack
    --"bounty_hunter_wind_walk",
    "brewmaster_thunder_clap",
    "brewmaster_cinder_brew", -- NEW
    "brewmaster_drunken_brawler",
    "bristleback_viscous_nasal_goo",
    "bristleback_quill_spray",
    "bristleback_bristleback", -- VERIFIED: NO CRASH
    --"broodmother_spawn_spiderlings",
    --"broodmother_spin_web", -- Just a mess
    "broodmother_incapacitating_bite",
    "centaur_hoof_stomp",
    "centaur_double_edge",
    "centaur_return",
    "chaos_knight_chaos_bolt",
    "chaos_knight_reality_rift",
    "chaos_knight_chaos_strike", -- Random chance doesn't work
    "chen_penitence", -- VERIFIED: NO CRASH
    "chen_divine_favor", -- NEW
    --"chen_holy_persuasion", -- Isn't cast
    "clinkz_strafe",
    "clinkz_searing_arrows",
    --"clinkz_wind_walk",
    "crystal_maiden_crystal_nova",
    "crystal_maiden_frostbite",
    "crystal_maiden_brilliance_aura",
    "dark_seer_vacuum",
    "dark_seer_ion_shell",
    "dark_seer_surge",
    "dark_willow_bramble_maze",
    --"dark_willow_shadow_realm",
    "dark_willow_cursed_crown",
    "dazzle_poison_touch",
    "dazzle_shallow_grave",
    "dazzle_shadow_wave",
    "death_prophet_carrion_swarm",
    "death_prophet_silence",
    "death_prophet_spirit_siphon",
    "disruptor_thunder_strike",
    "disruptor_glimpse",
    "disruptor_kinetic_field",
    "doom_bringer_scorched_earth",
    "doom_bringer_infernal_blade",
    "dragon_knight_breathe_fire",
    "dragon_knight_dragon_tail",
    --"dragon_knight_dragon_blood", -- doesnt apply
    "drow_ranger_frost_arrows",
    "drow_ranger_wave_of_silence",
    --"drow_ranger_trueshot", -- based on agility, so it's 0 bonus
    "earth_spirit_boulder_smash",
    "earth_spirit_rolling_boulder",
    "earth_spirit_geomagnetic_grip",
    --"earth_spirit_petrify", -- isn't cast
    "earthshaker_fissure",
    "earthshaker_enchant_totem",
    "earthshaker_aftershock", --NEWish
    --"elder_titan_echo_stomp", -- channels R broken
    "elder_titan_ancestral_spirit",
    "elder_titan_natural_order",
    "ember_spirit_searing_chains",
    "ember_spirit_sleight_of_fist",
    "ember_spirit_flame_guard",
    "enchantress_untouchable",
    "enchantress_enchant",
    "enchantress_natures_attendants",
    "enigma_malefice",
    "enigma_demonic_conversion",
    "enigma_midnight_pulse",
    "faceless_void_time_walk",
    "faceless_void_time_dilation",
    "faceless_void_time_lock", -- VERIFIED: NO CRASH & WORKS AS INTENDED
    "furion_sprout",
    "furion_teleportation",
    "furion_force_of_nature", -- too dumb to use it right, but WHO CARES
    "grimstroke_dark_artistry",
    "grimstroke_ink_creature",
    "grimstroke_spirit_walk",
    "gyrocopter_rocket_barrage",
    "gyrocopter_homing_missile",
    "gyrocopter_flak_cannon", -- VERIFIED: NO CRASH
    "huskar_inner_fire", -- NEW
    --"huskar_burning_spear", -- Crashes the game
    "huskar_berserkers_blood",
    --"invoker_cold_snap", --IsHidden()
    --"invoker_ghost_walk",
    --"invoker_tornado", -- IsHidden()
    --"invoker_emp",
    --"invoker_alacrity",
    --"invoker_chaos_meteor",
    --"invoker_sun_strike", -- IsHidden()
    --"invoker_forge_spirit",
    --"invoker_ice_wall",
    --"invoker_deafening_blast", -- IsHidden() VERIFIED: NO CRASH
    "jakiro_dual_breath",
    "jakiro_ice_path",
    "jakiro_liquid_fire",
    "juggernaut_blade_fury",
    "juggernaut_healing_ward",
    --"juggernaut_blade_dance", -- chance based
    --"keeper_of_the_light_illuminate", -- does not work - charges up then nothing
    "keeper_of_the_light_blinding_light", -- NEW
    "keeper_of_the_light_chakra_magic",
    "kunkka_torrent",
    "kunkka_tidebringer",
    "kunkka_x_marks_the_spot",
    "legion_commander_overwhelming_odds",
    "legion_commander_press_the_attack",
    --"legion_commander_moment_of_courage", -- chance based
    "leshrac_split_earth",
    "leshrac_diabolic_edict",
    "leshrac_lightning_storm",
    "lich_frost_nova",
    "lich_frost_shield", -- NEW
    "lich_sinister_gaze", -- NEW
    "life_stealer_rage",
    "life_stealer_feast",
    "life_stealer_open_wounds",
    "lina_dragon_slave",
    "lina_light_strike_array",
    "lina_fiery_soul", -- NEWish
    "lion_impale",
    "lion_voodoo",
    "lion_mana_drain",
    --"lone_druid_spirit_bear",
    "lone_druid_savage_roar",
    "luna_lucent_beam",
    "luna_moon_glaive",
    "luna_lunar_blessing",
    "lycan_summon_wolves",
    "lycan_howl",
    "lycan_feral_impulse",
    "magnataur_shockwave",
    "magnataur_empower",
    "magnataur_skewer",
    "mars_spear",
    "mars_gods_rebuke",
    "mars_bulwark",
    "medusa_split_shot",
    "medusa_mystic_snake",
    "medusa_mana_shield",
    "meepo_earthbind", -- VERIFIED: NO CRASH
    "meepo_poof", -- VERIFIED: NO CRASH
    "mirana_starfall",
    "mirana_arrow",
    "mirana_leap",
    "monkey_king_boundless_strike",
    --"monkey_king_tree_dance", --doesn't do anything
    --"monkey_king_primal_spring", --doesn't do anything
    "monkey_king_mischief",
    --"naga_siren_mirror_image", --doesn't do anything
    "morphling_waveform", -- NEWish
    "naga_siren_ensnare",
    "naga_siren_rip_tide",
    "necrolyte_death_pulse",
    "necrolyte_sadist", -- VERIFIED: NO CRASH
    --"necrolyte_heartstopper_aura", -- no effect
    "nevermore_shadowraze1",
    "nevermore_shadowraze2",
    "nevermore_shadowraze3",
    "nevermore_necromastery",
    "nevermore_dark_lord",
    "night_stalker_void",
    "night_stalker_crippling_fear",
    "night_stalker_hunter_in_the_night",
    "nyx_assassin_impale",
    "nyx_assassin_mana_burn",
    "nyx_assassin_spiked_carapace",
    --"nyx_assassin_burrow", -- burrowed creep, sadly, does not do a single thing
    --"obsidian_destroyer_arcane_orb",
    "obsidian_destroyer_astral_imprisonment",
    "obsidian_destroyer_equilibrium", -- NEW
    "ogre_magi_fireblast",
    "ogre_magi_ignite",
    "ogre_magi_bloodlust",
    "omniknight_purification",
    "omniknight_repel",
    "omniknight_degen_aura",
    --"oracle_fortunes_end", --Doesn't work
    "oracle_fates_edict",
    "oracle_purifying_flames",
    "pangolier_swashbuckle",
    "pangolier_shield_crash",
    "pangolier_lucky_shot",
    "phantom_assassin_stifling_dagger",
    --"phantom_assassin_phantom_strike", -- doesn't cast
    "phantom_assassin_blur", -- VERIFIED: NO CRASH
    "phantom_lancer_phantom_edge", -- NEWish
    "phoenix_icarus_dive",
    "phoenix_sun_ray",
    "puck_illusory_orb",
    "puck_waning_rift",
    "puck_phase_shift",
    "pudge_meat_hook",
    "pudge_rot",
    --"pudge_flesh_heap", -- Crashes game
    "pugna_nether_blast",
    "pugna_decrepify",
    "pugna_nether_ward",
    "queenofpain_shadow_strike",
    "queenofpain_blink",
    "queenofpain_scream_of_pain",
    "rattletrap_battery_assault",
    "rattletrap_power_cogs",
    --"rattletrap_rocket_flare",
    "razor_plasma_field", -- VERIFIED: NO CRASH
    "razor_static_link", -- VERIFIED: NO CRASH
    "razor_unstable_current", -- VERIFIED: NO CRASH
    "riki_smoke_screen", -- VERIFIED: NO CRASH
    --"riki_blink_strike", -- does nothing
    "riki_tricks_of_the_trade",
    "rubick_telekinesis",
    "rubick_fade_bolt",
    "rubick_arcane_supremacy", -- NEW
    "sandking_burrowstrike",
    "sandking_sand_storm",
    "sandking_caustic_finale",
    --"shadow_demon_disruption", -- spawns illusions
    "shadow_demon_soul_catcher",
    "shadow_demon_shadow_poison",
    "shadow_shaman_ether_shock",
    "shadow_shaman_voodoo",
    --"shadow_shaman_shackles", -- Crashes the game?...
    "shredder_whirling_death",
    "shredder_timber_chain",
    "shredder_reactive_armor",
    "silencer_curse_of_the_silent",
    --"silencer_glaives_of_wisdom",
    "silencer_last_word",
    "skeleton_king_hellfire_blast",
    "skeleton_king_vampiric_aura",
    --"skeleton_king_mortal_strike", -- Chance based is a no-no
    "skywrath_mage_arcane_bolt",
    "skywrath_mage_concussive_shot",
    "skywrath_mage_ancient_seal",
    "slardar_sprint",
    "slardar_slithereen_crush",
    "slardar_bash", -- NEW
    "slark_dark_pact", -- VERIFIED: NO CRASH
    "slark_pounce",
    "slark_essence_shift", -- VERIFIED: NO CRASH
    "snapfire_scatterblast",
    "snapfire_firesnap_cookie",
    "snapfire_lil_shredder",
    "sniper_shrapnel",
    "sniper_headshot", -- VERIFIED: NO CRASH & WORKING AS INTENDED
    "sniper_take_aim",
    "spectre_spectral_dagger",
    "spectre_desolate",
    "spectre_dispersion",
    "spirit_breaker_charge_of_darkness", -- VERIFIED: NO CRASH
    "spirit_breaker_bulldoze", -- NEW
    "spirit_breaker_greater_bash",
    --"storm_spirit_static_remnant", -- super shifty
    "storm_spirit_electric_vortex",
    "storm_spirit_overload", -- Completely useless as a lone ability
    "sven_storm_bolt",
    "sven_great_cleave",
    "sven_warcry",
    --"techies_land_mines", -- dont explode
    --"techies_stasis_trap",
    "techies_suicide",
    --"techies_minefield_sign", -- :( isn't cast
    "templar_assassin_refraction",
    "templar_assassin_meld",
    "templar_assassin_psi_blades",
    "terrorblade_reflection",
    --"terrorblade_conjure_image", -- summons illusions
    --"terrorblade_metamorphosis", -- doesn't activate?
    "tidehunter_gush",
    "tidehunter_kraken_shell",
    "tidehunter_anchor_smash",
    "tinker_laser",
    "tinker_heat_seeking_missile",
    "tinker_march_of_the_machines",
    "tiny_avalanche",
    --"tiny_toss", --isn't cast
    --"tiny_craggy_exterior", -- not used
    --"treant_natures_guise", -- doesn't do anything
    "treant_natures_grasp",
    "treant_leech_seed",
    --"treant_living_armor",
    --"treant_eyes_in_the_forest", --isn't cast - tree is the target?
    --"troll_warlord_berserkers_rage", --doesn't activate?
    "troll_warlord_whirling_axes_ranged", -- VERIFIED: NO CRASH
    "troll_warlord_fervor", -- VERIFIED: NO CRASH & WORKS AS INTENDED
    "tusk_ice_shards",
    "tusk_snowball",
    "tusk_tag_team",
    --"undying_decay", -- Crashes the game
    "undying_soul_rip",
    "undying_tombstone",
    "ursa_earthshock",
    "ursa_overpower",
    "ursa_fury_swipes", -- VERIFIED: NO CRASH & WORKS AS INTENDED
    "vengefulspirit_magic_missile",
    "vengefulspirit_wave_of_terror",
    "vengefulspirit_command_aura",
    "venomancer_venomous_gale",
    "venomancer_poison_sting",
    "venomancer_plague_ward",
    "viper_poison_attack",
    "viper_nethertoxin",
    "viper_corrosive_skin",
    "visage_grave_chill",
    "visage_soul_assumption",
    "visage_gravekeepers_cloak",
    --"void_spirit_aether_remnant",
    --"void_spirit_dissimilate",
    "void_spirit_resonant_pulse",
    "warlock_fatal_bonds",
    "warlock_shadow_word",
    --"warlock_upheaval", -- Lasts forever. Dangerous.
    "weaver_the_swarm",
    --"weaver_shukuchi",
    "weaver_geminate_attack",
    "windrunner_shackleshot",
    "windrunner_powershot",
    "windrunner_windrun",
    "winter_wyvern_arctic_burn",
    "winter_wyvern_splinter_blast",
    "winter_wyvern_cold_embrace",
    --"wisp_tether", -- For some reason this isn't cast -- hero only?
    "wisp_spirits",
    "wisp_overcharge", -- :D
    "witch_doctor_paralyzing_cask",
    "witch_doctor_voodoo_restoration",
    "witch_doctor_maledict",
    "zuus_arc_lightning",
    "zuus_lightning_bolt",
    "zuus_static_field", -- Alone makes no sense
  },
  ultimate = {
    "abaddon_borrowed_time",
    --"abyssal_underlord_dark_rift", -- Teleports in place instead of teleporting to target
    "alchemist_chemical_rage",
    --"arc_warden_tempest_double", -- CRASHES THE GAME
    "axe_culling_blade",
    "bane_fiends_grip",
    "batrider_flaming_lasso",
    "beastmaster_primal_roar",
    --"bloodseeker_rupture", -- Missing textures can possibly crash the game?
    "bounty_hunter_track",
    "brewmaster_primal_split",
    "bristleback_warpath", -- NEWish
    "broodmother_insatiable_hunger",
    "centaur_stampede",
    --"chaos_knight_phantasm", --doesn't do crap
    "chen_hand_of_god",
    "clinkz_burning_army", -- NEW
    "crystal_maiden_freezing_field",
    "dark_seer_wall_of_replica",
    "dark_willow_bedlam",
    "dazzle_bad_juju", -- NEW
    "death_prophet_exorcism", -- VERIFIED: NO CRASH
    "disruptor_static_storm",
    "doom_bringer_doom",
    "dragon_knight_elder_dragon_form",
    --"drow_ranger_marksmanship", -- Creeps don't use agility and aghs crashes the game
    "earth_spirit_magnetize",
    "earthshaker_echo_slam",
    "elder_titan_earth_splitter",
    "enchantress_impetus",
    --"enigma_black_hole",  -- Lasts forever. Dangerous.
    --"faceless_void_chronosphere", -- Doesn't freeze anything
    "furion_wrath_of_nature",
    "grimstroke_soul_chain",
    "gyrocopter_call_down",
    "huskar_life_break",
    "jakiro_macropyre",
    "juggernaut_omni_slash",
    "legion_commander_duel", -- VERIFIED: NO CRASH
    "leshrac_pulse_nova",
    "lich_chain_frost",
    --"life_stealer_infest", isn't cast
    "lina_laguna_blade",
    "lion_finger_of_death",
    --"luna_eclipse", --ok, that one isn't even funny
    "lycan_shapeshift",
    "magnataur_reverse_polarity",
    "mars_arena_of_blood",
    "medusa_stone_gaze",
    --"meepo_divided_we_stand", -- Does nothing
    "mirana_invis",
    --"monkey_king_wukongs_command", -- Crashes the game
    --"naga_siren_song_of_the_siren",
    "necrolyte_reapers_scythe",
    "nevermore_requiem",
    "night_stalker_darkness",
    --"nyx_assassin_vendetta",
    --"obsidian_destroyer_sanity_eclipse", -- CRASHES THE GAME
    --"ogre_magi_multicast", -- Doesn't make sense as a lone ability
    "omniknight_guardian_angel",
    "oracle_false_promise",
    "pangolier_gyroshell",
    "phantom_assassin_coup_de_grace",
    "phoenix_supernova",
    "puck_dream_coil",
    "pudge_dismember",
    "pugna_life_drain",
    "queenofpain_sonic_wave",
    --"rattletrap_hookshot", -- Crashes the game
    "razor_eye_of_the_storm",
    --"riki_permanent_invisibility",
    --"sandking_epicenter", -- Channels R broken
    "shadow_demon_demonic_purge",
    --shadow_shaman_mass_serpent_ward", -- Crashed the game (when too many of them)
    --"shredder_chakram", -- Some chakrams last too long
    "silencer_global_silence",
    --"skeleton_king_reincarnation", -- Doesn't do anything
    "skywrath_mage_mystic_flare",
    "slardar_amplify_damage",
    --"slark_shadow_dance", -- Passive works, the active doesn't. Otherwise it is suspected of causing a crash.
    --"snapfire_mortimer_kisses",
    --"sniper_assassinate", -- Channels R Broken
    --"spectre_haunt", --Illusions requested but none spawned
    "spirit_breaker_nether_strike",
    "storm_spirit_ball_lightning", -- VERIFIED: NO CRASH
    "sven_gods_strength",
    --"terrorblade_sunder", -- Is never cast for some reason - hero only?
    "tidehunter_ravage",
    --"tinker_rearm", -- :D PLZ BAN TINKER
    "tiny_grow",
    "treant_overgrowth",
    "troll_warlord_battle_trance", -- NEW
    "tusk_walrus_kick",
    "tusk_walrus_punch",
    "undying_flesh_golem",
    "ursa_enrage",
    "vengefulspirit_nether_swap",
    "venomancer_poison_nova",
    "viper_viper_strike",
    --"visage_summon_familiars", --Familiars R Dumb and don't do crap.
    "void_spirit_astral_step",
    "warlock_rain_of_chaos",
    --"weaver_time_lapse", -- not tested but I'm scared D:
    "windrunner_focusfire",
    "winter_wyvern_winters_curse",
    --"wisp_relocate", -- Particles persist beyond death. Dangerous leak
    --"witch_doctor_death_ward", -- Death wards stay forever and do nothing
    --"zuus_cloud", -- Crashes the game
    "zuus_thundergods_wrath",
  },
  debug = {
  },
}
return ability_listing