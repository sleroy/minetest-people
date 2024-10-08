local S = minetest.get_translator("people")

mobs:register_mob("people:plundererflask", {
	-- animal, monster, npc
	type = "monster",
	-- aggressive, shoots flasks
	passive = false,
	step_height = 2,
	fear_height = 4,
	damage = 10,
	attack_type = "shoot",
	shoot_interval = 1,
	arrow = "people:flask",
	shoot_offset = 2,
	attacks_monsters = false,
	-- health & armor
	hp_min = 20,
	hp_max = 40,
	armor = 100,
	-- textures and model
	collisionbox = { -0.35, -1.0, -0.35, 0.35, 0.8, 0.35 },
	visual = "mesh",
	mesh = "Plundererflask.b3d",
	drawtype = "front",
	textures = {
		{ "textureplundererflask.png" },
	},
	visual_size = { x = 1, y = 1 },
	-- sounds
	makes_footstep_sound = true,
	sounds = {
		shoot_attack = "people_plundererflask2",
		random = "people_plundererflask",
		damage = "people_plundererflask3",
		distance = 15,
	},
	-- speed and jump
	walk_velocity = 2,
	run_velocity = 3,
	walk_chance = 10,
	jump = true,
	jump_height = 4,
	stay_near = { { "people:bootynode" }, 5 },
	drops = {
		{ name = "people:forge",           chance = 7, min = 1, max = 1 },
		{ name = "people:feeder",          chance = 7, min = 1, max = 1 },
		{ name = "people:mineshaft",       chance = 7, min = 1, max = 1 },
		{ name = "people:villagerbed",     chance = 7, min = 1, max = 1 },
		{ name = "people:weaponstand",     chance = 7, min = 1, max = 1 },
		{ name = "people:firstaidnode",    chance = 7, min = 1, max = 1 },
		{ name = "people:emblemoftriumph", chance = 7, min = 1, max = 1 },
	},
	-- damaged by
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = 0,
	view_range = 15,
	-- model animation
	animation = {
		speed_normal = 70,
		speed_run = 100,
		stand_speed = 50,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		run_start = 100,
		run_end = 200,
		shoot_start = 200,
		shoot_end = 300,
		speed_shoot = 55,
		die_start = 200,
		die_end = 300,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},
})

-- if not mobs.custom_spawn_people then
mobs:spawn({
	name = "people:plundererflask",
	nodes = { "mcl_core:cobble", "mcl_core:mossycobble", "mcl_core:sandstonebrick" },
	neighbors = { "people:bootynode" },
	min_light = 0,
	interval = 30,
	active_object_count = 2,
	chance = 10, -- 15000
	min_height = -100,
	max_height = 1000,
})

mobs:register_egg("people:plundererflask", S "Plunderer with Flask", "aplundererflask.png")

mobs:register_arrow("people:flask", {
	visual = "sprite",
	visual_size = { x = .5, y = .5 },
	textures = { "flask.png" },
	velocity = 12,
	drop = true,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = { fleshy = 13 },
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = { fleshy = 13 },
		}, nil)
	end,

	hit_node = function(self, pos, node)
	end,
})
