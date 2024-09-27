-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local S = minetest.get_translator and minetest.get_translator("people") or
	dofile(path .. "intllib.lua")

mobs.intllib = S

-- Check for custom mob spawn file

local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_monster = true
	input:close()
	input = nil
end


-- Animals
dofile(path .. "goat.lua")              --
dofile(path .. "dog.lua")               --
dofile(path .. "hunger.lua")            --
dofile(path .. "forge.lua")             --
dofile(path .. "feeder.lua")            --
dofile(path .. "weaponstand.lua")       --
dofile(path .. "villagerbed.lua")       --
dofile(path .. "mineshaft.lua")         --
dofile(path .. "firstaidnode.lua")      --
dofile(path .. "bootynode.lua")         --
dofile(path .. "plunderercrossbow.lua") --
dofile(path .. "pirate.lua")            --
dofile(path .. "plundererstick.lua")    --
dofile(path .. "plundererflask.lua")    --
dofile(path .. "spawnbooty.lua")        --
dofile(path .. "medsmith.lua")          --
dofile(path .. "afrsmith.lua")          --
dofile(path .. "norsmith.lua")          --
dofile(path .. "chinsmith.lua")         --
dofile(path .. "samsmith.lua")          --
dofile(path .. "medfarmer.lua")         --
dofile(path .. "norfarmer.lua")         --
dofile(path .. "samfarmer.lua")         --
dofile(path .. "afrfarmer.lua")         --
dofile(path .. "chinfarmer.lua")        --
dofile(path .. "medvillager.lua")       --
dofile(path .. "aravillager.lua")       --
dofile(path .. "papvillager.lua")       --
dofile(path .. "ewevillager.lua")       --
dofile(path .. "norvillager.lua")       --
dofile(path .. "medminer.lua")          --
dofile(path .. "araminer.lua")          --
dofile(path .. "abominer.lua")          --
dofile(path .. "eweminer.lua")          --
dofile(path .. "norminer.lua")          --
dofile(path .. "jealousminer.lua")      --
dofile(path .. "hatefulminer.lua")      --
dofile(path .. "evilminer.lua")         --
dofile(path .. "meddoctor.lua")         --
dofile(path .. "aradoctor.lua")         --
dofile(path .. "chindoctor.lua")        --
dofile(path .. "nordoctor.lua")         --
dofile(path .. "papdoctor.lua")         --
dofile(path .. "medwarrior.lua")        --
dofile(path .. "norwarrior.lua")        --
dofile(path .. "samwarrior.lua")        --
dofile(path .. "ewewarrior.lua")        --
dofile(path .. "afrwarrior.lua")        --
dofile(path .. "medinstructor.lua")     --
dofile(path .. "norinstructor.lua")     --
dofile(path .. "chininstructor.lua")    --
dofile(path .. "afrinstructor.lua")     --
dofile(path .. "aboinstructor.lua")     --
dofile(path .. "zombiedoctor.lua")      --
dofile(path .. "zombiesmith.lua")       --
dofile(path .. "zombievillager.lua")    --
dofile(path .. "zombiewarrior.lua")     --
dofile(path .. "zombiefarmer.lua")      --
dofile(path .. "zombieinstructor.lua")  --
dofile(path .. "zombieminer.lua")       --
dofile(path .. "ridepig.lua")           --
dofile(path .. "rideelephant.lua")      --
dofile(path .. "rideostrich.lua")       --
dofile(path .. "ridehorse.lua")         --
dofile(path .. "ridereindeer.lua")      --
dofile(path .. "rideox.lua")            --
dofile(path .. "plough.lua")            --


local beds = { "mcl_beds:bed_red_bottom",
	"mcl_beds:bed_blue_bottom",
	"mcl_beds:bed_cyan_bottom",
	"mcl_beds:bed_grey_bottom",
	"mcl_beds:bed_silver_bottom",
	"mcl_beds:bed_black_bottom",
	"mcl_beds:bed_yellow_bottom",
	"mcl_beds:bed_green_bottom",
	"mcl_beds:bed_magenta_bottom",
	"mcl_beds:bed_orange_bottom",
	"mcl_beds:bed_purple_bottom",
	"mcl_beds:bed_brown_bottom",
	"mcl_beds:bed_pink_bottom",
	"mcl_beds:bed_lime_bottom",
	"mcl_beds:bed_light_blue_bottom",
	"mcl_beds:bed_white_bottom",
	"mcl_beds:bed_red_top",
	"mcl_beds:bed_blue_top",
	"mcl_beds:bed_cyan_top",
	"mcl_beds:bed_grey_top",
	"mcl_beds:bed_silver_top",
	"mcl_beds:bed_black_top",
	"mcl_beds:bed_yellow_top",
	"mcl_beds:bed_green_top",
	"mcl_beds:bed_magenta_top",
	"mcl_beds:bed_orange_top",
	"mcl_beds:bed_purple_top",
	"mcl_beds:bed_brown_top",
	"mcl_beds:bed_pink_top",
	"mcl_beds:bed_lime_top",
	"mcl_beds:bed_light_blue_top",
	"mcl_beds:bed_white_top" }

local function TableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end
local function TableConcat3(t1, t2, t3)
	return TableConcat(TableConcat(t1, t2), t3)
end

local farmer_neighbors = { "people:feeder", "mcl_core:cobble", "mcl_farming:soil_wet", "mcl_farming:potato_1",
	"mcl_farming:potato_2", "mcl_farming:potato_3", "mcl_farming:soil", "mcl_farming:wheat", "mcl_farming:carrot",
	"mcl_composters:composter" }

local farm_nodes = { "mcl_trees:tree_spruce", "mcl_farming:potato", "mcl_core:grass_path", "mcl_core:podzol",
	"mcl_core:dirt_with_grass", "mcl_core:soil_wet", "mcl_core:dirt", "mcl_stairs:stair_oak_bark",
	"mcl_composters:composter" }

local doctor_neighbors = { "people:firstaidnode", "mcl_cauldrons:cauldron", "mcl_lectern:lectern" }
local warrior_near = { "people:weaponstand", "people:villagerbed", "mcl_books:bookshelf", "mcl_itemframes:item_frame",
	"mcl_lanterns:lantern", "mcl_lanterns:soul_lantern", "mcl_candles:candle", "mcl:bookcase", "xdecor:tv",
	"mcl_lanterns:sea_lantern",
	"mcl_books:bookshelf", "mcl_boats:chest_boat", "livingcaves:root_lamp", "mcl_chests:chest",
	"mcl_core:mese_post_light_pine_wood", "mcl_nether:glowstone" }
local forge_near = { "people:forge", "mcl_anvils:anvil", "mcl_core:stonebrickcarved" }
local miner_near = { "mcl_anvils:anvil", "mcl_core:packed_ice" }
local instructor_near = { "people:weaponstand", "mcl_core:stonebrickcarved" }

local villager_near = { 'mcl_core:stonebrick', "mcl_core:pine_wood", "mcl_stairs:slab_spruce_top",
	"mcl_doors:door_spruce_b_1", "mcl_doors:door_spruce_t_1" }
local villager_nodes = { "mcl_stairs:slab_spruce_top", "mcl_wool:silver_carpet", "mcl_wool:silver_carpet",
	"mcl_wool:grey_carpet", "mcl_wool:blue_carpet", "mcl_wool:green_carpet",
	"mcl_wool:green_carpetmcl_wool:lime_carpet", "mcl_wool:purple_carpet", "mcl_wool:pink_carpet",
	"mcl_wool:yellow_carpet", "mcl_wool:orange_carpet", "mcl_wool:red_carpet", "mcl_wool:cyan_carpet",
	"mcl_wool:magenta_carpet", "mcl_wool:black_carpet", "mcl_wool:light_blue_carpet" }
local doctor_nodes = { "mcl_wool:white_carpet", "mcl_core:stonebrick", "mcl_wool:brown_carpet",
	"mcl_wool:silver_carpet", "mcl_wool:silver_carpet",
	"mcl_wool:grey_carpet", "mcl_wool:blue_carpet", "mcl_wool:green_carpet",
	"mcl_wool:green_carpetmcl_wool:lime_carpet", "mcl_wool:purple_carpet", "mcl_wool:pink_carpet",
	"mcl_wool:yellow_carpet", "mcl_wool:orange_carpet", "mcl_wool:red_carpet", "mcl_wool:cyan_carpet",
	"mcl_wool:magenta_carpet", "mcl_wool:black_carpet", "mcl_wool:light_blue_carpet", "mcl_trees:tree_birch",
	"mcl_trees:tree_dark_oak", "mcl_trees:tree_acacia", "mcl_trees:tree_jungle", "mcl_trees:tree_spruce",
	"mcl_trees:tree_oak", "mcl_trees:tree_oak", "mcl_trees:tree_mangrove", "mcl_trees:tree_crimson",
	"mcl_trees:tree_warped", "mcl_trees:tree_bamboo", "mcl_trees:tree_cherry_blossom",
	"mcl_trees:wood_birch", "mcl_trees:wood_dark_oak", "mcl_trees:wood_dark_oak", "mcl_trees:wood_acacia" }
local mine_nodes = { 'mcl_core:stone', 'mcl_core:dirt', 'mcl_core:cobble' }

local all_biomes = {
	"flat",
	"MegaTaiga",
	"MegaSpruceTaiga",
	"ExtremeHills",
	"ExtremeHills_beach",
	"ExtremeHillsM",
	"ExtremeHills+",
	"StoneBeach",
	"Plains",
	"Plains_beach",
	"SunflowerPlains",
	"Taiga",
	"Taiga_beach",
	"Forest",
	"Forest_beach",
	"FlowerForest",
	"FlowerForest_beach",
	"BirchForest",
	"BirchForestM",
	"RoofedForest",
	"Savanna",
	"Savanna_beach",
	"SavannaM",
	"Jungle",
	"BambooJungle",
	"Jungle_shore",
	"JungleM",
	"JungleM_shore",
	"JungleEdge",
	"JungleEdgeM",
	"Swampland",
	"Swampland_shore"
}

local nor_nodes = { 'mcl_core:snow', 'mcl_core:ice', 'mcl_core:stonebrick', 'mcl_core:snow2', "mcl_core:dirt" }
local nor_neigh = { "mcl_ocean:sea_lantern" }
local nor_biomes = {
	"flat",
	"MegaTaiga",
	"MegaSpruceTaiga",
	"ExtremeHills",
	"ExtremeHills_beach",
	"ExtremeHillsM",
	"ExtremeHills+",
	"Taiga",
	"Taiga_beach",
	"Forest",
	"Forest_beach",
}

local afr_nodes = { "mcl_core:sand", "mcl_core:sandstone", "mcl_core:sandsmooth", "mcl_core:sandsmooth2",
	"mcl_core:gravel" }
local afr_neigh = {}
local afr_biomes = {
	"flat",
	"StoneBeach",
	"Plains_beach",
	"Savanna",
	"Savanna_beach",
	"SavannaM"
}


local ara_nodes = { "mcl_core:sand", "mcl_core:sandstone", "mcl_core:sandsmooth", "mcl_core:sandsmooth2",
	"mcl_core:gravel" }
local ara_neigh = {}
local ara_biomes = {
	"flat",
	"ExtremeHills",
	"ExtremeHills_beach",
	"ExtremeHillsM",
	"ExtremeHills+",
	"StoneBeach",
	"Plains",
	"Plains_beach",
	"SunflowerPlains",
	"Jungle",
	"BambooJungle",
	"Jungle_shore",
	"JungleM",
	"JungleM_shore",
	"JungleEdge",
	"JungleEdgeM",
	"Swampland",
	"Swampland_shore"
}

local chin_nodes = { "mcl_trees:tree_dark_oak", "mcl_trees:tree_acacia", "mcl_trees:tree_jungle", "mcl_trees:tree_spruce",
	"mcl_trees:tree_oak", "mcl_trees:tree_oak", "mcl_trees:tree_mangrove", "mcl_trees:tree_crimson",
	"mcl_trees:tree_warped", "mcl_trees:tree_bamboo", "mcl_trees:tree_cherry_blossom", "mcl_core:stonebrick",
	"mcl_core:cobble", "mcl_core:dirt_with_grass",
	"mcl_trees:wood_birch", "mcl_trees:wood_dark_oak", "mcl_trees:wood_dark_oak", "mcl_trees:wood_acacia" }
local chin_neigh = { "mcl_trees:tree_dark_oak", "mcl_trees:tree_acacia", "mcl_trees:tree_jungle", "mcl_trees:tree_spruce",
	"mcl_trees:tree_oak", "mcl_trees:tree_oak", "mcl_trees:tree_mangrove", "mcl_trees:tree_crimson",
	"mcl_core:dirt_with_grass",
	"mcl_trees:tree_warped", "mcl_trees:tree_bamboo", "mcl_trees:tree_cherry_blossom", "mcl_core:stonebrick",
	"mcl_core:cobble",
	"mcl_trees:wood_birch", "mcl_trees:wood_dark_oak", "mcl_trees:wood_dark_oak", "mcl_trees:wood_acacia" }
local chin_biomes = {
	"flat",
	"Forest",
	"Forest_beach",
	"FlowerForest",
	"FlowerForest_beach",
	"BirchForest",
	"BirchForestM",
	"RoofedForest",
	"Jungle",
	"BambooJungle",
	"Jungle_shore",
	"JungleM",
	"JungleM_shore",
	"JungleEdge",
	"JungleEdgeM",
	"Swampland",
	"Swampland_shore"
}


local ewe_nodes = { "mcl_trees:tree_dark_oak", "mcl_trees:tree_acacia", "mcl_trees:tree_jungle", "mcl_trees:tree_spruce",
	"mcl_trees:tree_oak", "mcl_trees:tree_oak", "mcl_trees:tree_mangrove", "mcl_trees:tree_crimson",
	"mcl_trees:tree_warped", "mcl_trees:tree_bamboo", "mcl_trees:tree_cherry_blossom", "mcl_core:stonebrick",
	"mcl_core:cobble",
	"mcl_trees:wood_birch", "mcl_trees:wood_dark_oak", "mcl_trees:wood_dark_oak", "mcl_trees:wood_acacia" }
local ewe_neigh = {}
local ewe_biomes = {
	"flat",
	"Forest",
	"Forest_beach",
	"FlowerForest",
	"FlowerForest_beach",
	"BirchForest",
	"BirchForestM",
	"RoofedForest"
}


local med_nodes = { "mcl_trees:tree_dark_oak", "mcl_trees:tree_acacia", "mcl_trees:tree_jungle", "mcl_trees:tree_spruce",
	"mcl_trees:tree_oak", "mcl_trees:tree_oak", "mcl_trees:tree_mangrove", "mcl_trees:tree_crimson",
	"mcl_trees:tree_warped", "mcl_trees:tree_bamboo", "mcl_trees:tree_cherry_blossom", "mcl_core:stonebrick",
	"mcl_stairs:slab_oak_top",
	"mcl_trees:wood_birch", "mcl_trees:wood_dark_oak", "mcl_trees:wood_dark_oak", "mcl_trees:wood_acacia" }
local med_neigh = {}
local med_biomes = {
	"flat",
	"Plains",
	"Plains_beach",
	"SunflowerPlains",
	"Swampland",
	"Swampland_shore"
}

local pap_nodes = { "mcl_trees:tree_dark_oak", "mcl_trees:tree_acacia", "mcl_trees:tree_jungle", "mcl_trees:tree_spruce",
	"mcl_trees:tree_oak", "mcl_trees:tree_oak", "mcl_trees:tree_mangrove", "mcl_trees:tree_crimson",
	"mcl_trees:tree_warped", "mcl_trees:tree_bamboo", "mcl_trees:tree_cherry_blossom", "mcl_core:stonebrick",
	"mcl_core:cobble",
	"mcl_trees:wood_birch", "mcl_trees:wood_dark_oak", "mcl_trees:wood_dark_oak", "mcl_trees:wood_acacia" }
local pap_neigh = {}
local pap_biomes = {
	"flat",
	"MegaTaiga",
	"MegaSpruceTaiga",
	"ExtremeHills",
	"Taiga",
	"Forest",
	"FlowerForest",
	"BirchForest",
	"BirchForestM",
	"RoofedForest",
	"Jungle",
	"BambooJungle",
	"Jungle_shore",
	"JungleM",
	"JungleM_shore",
	"JungleEdge",
	"JungleEdgeM",
	"Swampland",
	"Swampland_shore"
}


local sam_nodes = { "mcl_core:dirt_with_grass", "ethereal:green_dirt", "mcl_core:stonebrick", "mcl_core:cobble",
	"mcl_core:wood" }
local sam_neigh = {}
local sam_biomes = {
	"flat",
	"MegaTaiga",
	"MegaSpruceTaiga",
	"ExtremeHills",
	"Taiga",
	"Forest",
	"FlowerForest",
	"BirchForest",
	"BirchForestM",
	"RoofedForest",
	"Jungle",
	"BambooJungle",
	"Jungle_shore",
	"JungleM",
	"JungleM_shore",
	"JungleEdge",
	"JungleEdgeM",
	"Swampland",
	"Swampland_shore"
}


local all_people = {
	{ name = 'nordoctor',      nodes = TableConcat(nor_nodes, doctor_nodes),   neighbors = TableConcat(nor_neigh, doctor_neighbors),     biomes = nor_biomes },
	{ name = 'norfarmer',      nodes = farm_nodes,                             neighbors = TableConcat(nor_neigh, farmer_neighbors),     biomes = nor_biomes },
	{ name = 'norinstructor',  nodes = nor_nodes,                              neighbors = TableConcat(nor_neigh, instructor_near),      biomes = nor_biomes },
	{ name = 'norminer',       nodes = nor_nodes,                              neighbors = TableConcat(nor_neigh, miner_near),           biomes = nor_biomes },
	{ name = 'norsmith',       nodes = nor_nodes,                              neighbors = TableConcat(nor_neigh, forge_near),           biomes = nor_biomes },
	{ name = 'norvillager',    nodes = TableConcat(nor_nodes, villager_nodes), neighbors = TableConcat3(nor_neigh, beds, villager_near), biomes = nor_biomes },
	{ name = 'norwarrior',     nodes = nor_nodes,                              neighbors = TableConcat(nor_neigh, warrior_near),         biomes = nor_biomes },

	{ name = 'afrfarmer',      nodes = farm_nodes,                             neighbors = TableConcat(afr_neigh, farmer_neighbors),     biomes = afr_biomes },
	{ name = 'afrinstructor',  nodes = afr_nodes,                              neighbors = TableConcat(afr_neigh, instructor_near),      biomes = afr_biomes },
	{ name = 'afrsmith',       nodes = afr_nodes,                              neighbors = TableConcat(afr_neigh, forge_near),           biomes = afr_biomes },
	{ name = 'afrwarrior',     nodes = afr_nodes,                              neighbors = TableConcat(afr_neigh, warrior_near),         biomes = afr_biomes },

	{ name = 'aradoctor',      nodes = TableConcat(ara_nodes, doctor_nodes),   neighbors = TableConcat(ara_neigh, doctor_neighbors),     biomes = ara_biomes },
	{ name = 'araminer',       nodes = ara_nodes,                              neighbors = TableConcat(ara_neigh, miner_near),           biomes = ara_biomes },
	{ name = 'aravillager',    nodes = TableConcat(ara_nodes, villager_nodes), neighbors = TableConcat3(ara_neigh, beds, villager_near), biomes = ara_biomes },

	{ name = 'chindoctor',     nodes = TableConcat(chin_nodes, doctor_nodes),  neighbors = TableConcat(chin_neigh, doctor_neighbors),    biomes = chin_biomes },
	{ name = 'chinfarmer',     nodes = farm_nodes,                             neighbors = TableConcat(chin_neigh, farmer_neighbors),    biomes = chin_biomes },
	{ name = 'chininstructor', nodes = chin_nodes,                             neighbors = TableConcat(chin_neigh, instructor_near),     biomes = chin_biomes },
	{ name = 'chinsmith',      nodes = chin_nodes,                             neighbors = TableConcat(chin_neigh, forge_near),          biomes = chin_biomes },

	{ name = 'evilminer',      nodes = mine_nodes,                             neighbors = TableConcat(mine_nodes, miner_near),          biomes = all_biomes },
	{ name = 'hatefulminer',   nodes = mine_nodes,                             neighbors = TableConcat(mine_nodes, miner_near),          biomes = all_biomes },
	{ name = 'jealousminer',   nodes = mine_nodes,                             neighbors = TableConcat(mine_nodes, miner_near),          biomes = all_biomes },

	{ name = 'eweminer',       nodes = ewe_nodes,                              neighbors = TableConcat(ewe_nodes, miner_near),           biomes = ewe_biomes },
	{ name = 'ewevillager',    nodes = TableConcat(ewe_nodes, villager_nodes), neighbors = TableConcat3(ewe_neigh, beds, villager_near), biomes = ewe_biomes },
	{ name = 'ewewarrior',     nodes = ewe_nodes,                              neighbors = TableConcat(ewe_neigh, warrior_near),         biomes = ewe_biomes },

	{ name = 'meddoctor',      nodes = TableConcat(med_nodes, doctor_nodes),   neighbors = TableConcat(med_neigh, doctor_neighbors),     biomes = med_biomes },
	{ name = 'medfarmer',      nodes = farm_nodes,                             neighbors = TableConcat(med_neigh, farmer_neighbors),     biomes = med_biomes },
	{ name = 'medinstructor',  nodes = med_nodes,                              neighbors = TableConcat(med_neigh, instructor_near),      biomes = med_biomes },
	{ name = 'medminer',       nodes = med_nodes,                              neighbors = TableConcat(med_neigh, miner_near),           biomes = med_biomes },
	{ name = 'medsmith',       nodes = med_nodes,                              neighbors = TableConcat(med_neigh, forge_near),           biomes = med_biomes },
	{ name = 'medvillager',    nodes = TableConcat(med_nodes, villager_nodes), neighbors = TableConcat3(med_neigh, beds, villager_near), biomes = med_biomes },
	{ name = 'medwarrior',     nodes = med_nodes,                              neighbors = TableConcat(med_neigh, warrior_near),         biomes = med_biomes },

	{ name = 'papdoctor',      nodes = TableConcat(pap_nodes, doctor_nodes),   neighbors = TableConcat(pap_neigh, doctor_neighbors),     biomes = pap_biomes },
	{ name = 'papvillager',    nodes = TableConcat(pap_nodes, villager_nodes), neighbors = TableConcat3(pap_neigh, beds, villager_near), biomes = pap_biomes },

	{ name = 'samfarmer',      nodes = farm_nodes,                             neighbors = TableConcat(sam_neigh, farmer_neighbors),     biomes = sam_biomes },
	{ name = 'samsmith',       nodes = sam_nodes,                              neighbors = TableConcat(sam_neigh, forge_near),           biomes = sam_biomes },
	{ name = 'samwarrior',     nodes = sam_nodes,                              neighbors = TableConcat(sam_neigh, warrior_near),         biomes = sam_biomes },

	{
		name = 'pirate',
		nodes =
		{ "mcl_core:cobble", "mcl_core:mossycobble", "mcl_core:sandstonebrick" },
		neighbors = { "people:bootynode" },
		biomes = pap_biomes
	},
	{
		name = 'plough',
		nodes = {
			"ExtremeHills_beach",
			"StoneBeach",
			"Plains_beach",
			"Taiga_beach",
			"Forest_beach",
			"FlowerForest_beach",
			"Savanna_beach",
			"Jungle_shore",
			"JungleM_shore", },
		neighbors = villager_near,
		biomes = pap_biomes
	},
}

-- pirate, plough,


for key, villager in ipairs(all_people)
do
	local min_height = -170
	---- if not mobs.custom_spawn_people then
	---
	mobs:alias_mob(villager.name, villager.name)
	mobs:spawn({
		name = "people:" .. villager.name,
		nodes = villager.nodes,
		neighbors = villager.neighbors,
		min_light = 1,
		interval = 50,
		chance = 1500,
		min_height = min_height,
		max_height = 2000,
		daylight_toggle = true
	})

	--	mcl_mobs.spawn_setup({
	--		name = "people:" .. villager.name,
	--		type_of_spawning = "ground",
	--		dimension = "overworld",
	--		min_height = min_height,
	--		biomes = villager.biomes,
	--		chance = 500,
	--	})
end

-- Spawn all zombies with the same rule
zombies = { 'zombiedoctor', 'zombiefarmer', 'zombieinstructor', 'zombieminer', 'zombiesmith', 'zombievillager',
	'zombiewarrior' }

for key, zombie in ipairs(zombies)
do
	mobs:alias_mob(zombie, zombie)
	mcl_mobs.spawn_setup({
		name = "people:" .. zombie,
		type_of_spawning = "ground",
		dimension = "overworld",
		min_height = -1000,
		biomes = all_biomes,
		chance = 100,
	})
	mcl_mobs.spawn_setup({
		name = "people:" .. zombie,
		type_of_spawning = "lava",
		dimension = "nether",
		biomes = {
			"Nether",
			"BasaltDelta",
			"WarpedForest",
			"CrimsonForest",
			"SoulsandValley"
		},
		min_height = -29000,
		max_height = -28000,
		chance = 200,
	})
end
-- Load custom spawning if found

if mobs.custom_spawn_monster then
	dofile(path .. "spawn.lua")
end


print(S("[MOD] Mobs People loaded"))
