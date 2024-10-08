local S = minetest.get_translator("people")

mobs:register_mob("people:plundererstick", {
	type = "monster",
	passive = false,
	step_height = 2,
	fear_height = 4,
	attack_type = "dogfight",
	attack_animals = true,
	reach = 3,
	damage = 7,
	hp_min = 25,
	hp_max = 65,
	armor = 100,
	collisionbox = { -0.5, -0.01, -0.5, 0.5, 0.95, 0.5 },
	visual = "mesh",
	mesh = "Plundererstick.b3d",
	visual_size = { x = 1.0, y = 1.0 },
	textures = {
		{ "textureplundererstick.png" },
	},
	sounds = {
		attack = "people_plundererstick3",
		random = "people_plunderersick",
		damage = "people_plundererstick2",
		distance = 15,
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
	walk_chance = 10,
	runaway = false,
	stay_near = { { "people:bootynode" }, 5 },
	jump = true,
	jump_height = 2,
	drops = {
		{ name = "people:forge",           chance = 7, min = 1, max = 1 },
		{ name = "people:feeder",          chance = 7, min = 1, max = 1 },
		{ name = "people:mineshaft",       chance = 7, min = 1, max = 1 },
		{ name = "people:villagerbed",     chance = 7, min = 1, max = 1 },
		{ name = "people:weaponstand",     chance = 7, min = 1, max = 1 },
		{ name = "people:firstaidnode",    chance = 7, min = 1, max = 1 },
		{ name = "people:emblemoftriumph", chance = 7, min = 1, max = 1 },
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	animation = {
		speed_normal = 100,
		stand_speed = 50,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 200,
		punch_end = 300,
		die_start = 200,
		die_end = 300,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},
	view_range = 15,

	on_rightclick = function(self, clicker)
		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end
	end,
})

-- if not mobs.custom_spawn_people then
mobs:spawn({
	name = "people:plundererstick",
	nodes = { "mcl_core:cobble", "mcl_core:mossycobble", "mcl_core:sandstonebrick" },
	neighbors = { "people:bootynode" },
	min_light = 0,
	interval = 30,
	active_object_count = 2,
	chance = 1000, -- 15000
	min_height = -100,
	max_height = 1000,
})


mobs:register_egg("people:plundererstick", S("Plunderer with a Stick"), "aplundererstick.png")
