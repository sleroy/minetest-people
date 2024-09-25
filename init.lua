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
	"mcl_beds:bed_white_bottom" }

function TableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

local farmer_neighbors = { "people:feeder", "mcl_core:cobble", "mcl_farming:soil_wet" }


-- nordoctor.lua norfarmer.lua norinstructor.lua norminer.lua norsmith.lua norvillager.lua norwarrior.lua
local nor_people = {
	{ name = 'nordoctor',     neighbors = { 'mcl_core:snow', 'mcl_core:ice', 'mcl_core:stonebrick', 'mcl_core:snow2', "people:firstaidnode", "mcl_cauldrons:cauldron" } },
	{ name = 'norinstructor', neighbors = { 'mcl_core:snow', 'mcl_core:ice', 'mcl_core:stonebrick', 'mcl_core:snow2', "people:weaponstand" } },
	{ name = 'norminer',      neighbors = { 'mcl_core:snow', 'mcl_core:ice', 'mcl_core:stonebrick', 'mcl_core:snow2' } },
	{
		name = 'norsmith',
		neighbors = { 'mcl_core:snow', 'mcl_core:ice', 'mcl_core:stonebrick', 'mcl_core:snow2', "people:forge",
			"people:villagerbed",
			"mcl_books:bookshelf", "mcl_itemframes:item_frame", "mcl_lanterns:lantern", "mcl_lanterns:soul_lantern",
			"mcl_candles:candle", "mcl:bookcase", "xdecor:tv", "mcl_books:bookshelf", "mcl_boats:chest_boat",
			"livingcaves:root_lamp", "mcl_chests:chest", "mcl_core:mese_post_light_pine_wood", "mcl_nether:glowstone",
			"mcl_core:mese_post_light_pine_wood", "mcl_core:mese_post_light", "mcl_trees:wood_acacia",
			"mcl_core:mese_post_light_aspen_wood", "mcl_core:mese_post_light_junglewood", "animalworld:crocodilestool",
			"animalworld:elephantstool", "animalworld:bearstool", "animalworld:gnustool", "animalworld:hippostool",
			"animalworld:monitorstool", "animalworld:ivorychair", "animalworld:sealstool", "animalworld:yakstool",
			"animalworld:tigerstool", "animalworld:muskoxstool" }
	},
	{ name = 'norvillager', neighbors = TableConcat({ 'mcl_core:stonebrick', "mcl_core:pine_wood" }, beds) },
	{ name = 'norwarrior',  neighbors = { 'mcl_core:snow', 'mcl_core:ice', 'mcl_core:stonebrick', 'mcl_core:snow2' } },
	{ name = 'norfarmer',   neighbors = TableConcat({ 'mcl_core:snow', 'mcl_core:ice', 'mcl_core:stonebrick', 'mcl_core:snow2' }, farmer_neighbors) },
}


for key, villager in ipairs(nor_people)
do
	local min_height = 150
	---- if not mobs.custom_spawn_people then
	mobs:spawn({
		name = "people:" .. villager.name,
		nodes = { "mcl_core:snow", "mcl_core:ice", "mcl_core:snow_2" },
		neighbors = villager.neighbors,
		min_light = 1,
		interval = 60,
		chance = 500,
		min_height = min_height,
		max_height = 2000,
		day_toggle = true
	})

	mcl_mobs.spawn_setup({
		name = "people:" .. villager.name,
		type_of_spawning = "ground",
		dimension = "overworld",
		min_height = min_height,
		biomes = {
			"flat",
			"ExtremeHills",
			"ExtremeHills_beach",
			"ExtremeHillsM",
			"ExtremeHills+",
			"Savanna",
			"Savanna_beach",
			"SavannaM"
		},
		chance = 100,
	})
end

-- Afr rules
afr_people = {
	{ name = 'afrfarmer',     neighbors = { 'group:grass', 'mcl_core:dirt_with_grass' } },
	{ name = 'afrinstructor', neighbors = { 'group:grass', 'mcl_core:stonebrick' } },
	{ name = 'afrwarrior',    neighbors = { 'group:grass', 'mcl_core:stonebrick' } },
}
-- , 'afrinstructor', 'afrsmith', 'afrwarrior'

for key, villager in ipairs(afr_people)
do
	local min_height = 150
	---- if not mobs.custom_spawn_people then
	mobs:spawn({
		name = "people:" .. villager.name,
		nodes = { "mcl_core:dirt_with_grass", "ethereal:green_dirt", "mcl_core:stonebrick", "mcl_core:cobble", "mcl_farming:soil_wet", "mcl_core:dirt", "mcl_core:sand" },
		neighbors = villager.neighbors,
		min_light = 1,
		interval = 60,
		chance = 500,
		min_height = min_height,
		max_height = 2000,
		day_toggle = true
	})

	mcl_mobs.spawn_setup({
		name = "people:" .. villager.name,
		type_of_spawning = "ground",
		dimension = "overworld",
		min_height = min_height,
		biomes = {
			"flat",
			"ExtremeHills",
			"ExtremeHills_beach",
			"ExtremeHillsM",
			"ExtremeHills+",
			"Savanna",
			"Savanna_beach",
			"SavannaM"
		},
		chance = 100,
	})
end

-- Spawn all zombies with the same rule
zombies = { 'zombiedoctor', 'zombiefarmer', 'zombieinstructor', 'zombieminer', 'zombiesmith', 'zombievillager',
	'zombiewarrior' }

for key, zombie in ipairs(zombies)
do
	mcl_mobs.spawn_setup({
		name = "people:" .. zombie,
		type_of_spawning = "ground",
		dimension = "overworld",
		min_height = -1000,
		biomes = {
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
		},
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
