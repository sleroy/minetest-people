local S = minetest.get_translator("people")

mobs:register_mob("people:norvillager", {
	stepheight = 1,
	type = "animal",
	passive = true,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 2,
	hp_min = 30,
	hp_max = 60,
	armor = 100,
	collisionbox = {-0.35,-0.9,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "Villager.b3d",
	visual_size = {x = 0.9, y = 0.9},
	textures = {
		{"texturenorvillager.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "people_female2",
		damage = "people_female4",
		death = "people_femaledeath",
		distance = 10,
	},
	walk_velocity = 1.5,
	run_velocity = 2.5,
        walk_chance = 10,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "people:pirate", "people:evilminer", "people:jealousminer", "people:hatefulminer", "people:plunderercrossbow", "people:plundererflask", "people:plundererstick"},
	jump = true,
	jump_height = 6,
	pushable = true,
	follow = {"mcl_farming:potato_item", "mcl_farming:carrot_item", "mcl_farming:beetroot_item", "mcl_farming:bread", "mcl_farming:beetroot_soup", "pie:brpd_0", "mcl_farming:bread", "mcl_farming:wheat_seeds", "mcl_farming:cookie", "mcl_farming:beetroot_soup", "mcl_farming:pumpkin_pie", "mcl_farming:porridge", "mcl_farming:bibimbap", "mcl_farming:bread", "mcl_farming:paella", "mcl_farming:mac_and_cheese", "livingcaves:healingsoup", "mcl_farming:melon_item", "animalworld:escargots", "mcl_farming:rhubarb_pie", "mcl_farming:potato_omlet", "mcl_farming:potato_salad"},
	view_range = 10,
	drops = {		{name = "people:villagergrave", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
        stay_near = {{"people:villagerbed", "people:villagerbed", "mcl_books:bookshelf", "mcl_itemframes:item_frame","mcl_lanterns:lantern", "mcl_lanterns:soul_lantern", "mcl_candles:candle", "mcl:bookcase", "xdecor:tv", "mcl_books:bookshelf", "mcl_boats:chest_boat", "livingcaves:root_lamp", "mcl_chests:chest", "default:mese_post_light_pine_wood", "mcl_nether:glowstone", "default:mese_post_light_pine_wood", "default:mese_post_light", "mcl_trees:wood_acacia", "default:mese_post_light_aspen_wood", "default:mese_post_light_junglewood", "animalworld:crocodilestool", "animalworld:elephantstool", "animalworld:bearstool", "animalworld:gnustool", "animalworld:hippostool", "animalworld:monitorstool", "animalworld:ivorychair", "animalworld:sealstool", "animalworld:yakstool", "animalworld:tigerstool", "animalworld:muskoxstool"}, 4},
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		stand2_start = 100,
		stand2_end = 200,
		walk_speed = 65,
		walk_start = 200,
		walk_end = 300,
		die_start = 200,
		die_end = 300,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end
	end,
})


if not mobs.custom_spawn_people then
mobs:spawn({
	name = "people:norvillager",
	nodes = {"default:pine_wood"},
	neighbors = {"people:villagerbed"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	min_height = -25,
	max_height = 1000,
})
end

mobs:register_egg("people:norvillager", S("Villager Pine"), "anorvillager.png")


mobs:alias_mob("people:norvillager", "people:norvillager") -- compatibility
