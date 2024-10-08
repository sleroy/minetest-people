local S = minetest.get_translator("people")

mobs:register_mob("people:zombieinstructor", {
	type = "monster",
	passive = false,
	step_height = 2,
	fear_height = 4,
	attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
	damage = 5,
	hp_min = 35,
	hp_max = 75,
	armor = 100,
	collisionbox = { -0.5, -0.01, -0.5, 0.5, 1.3, 0.5 },
	visual = "mesh",
	mesh = "Zombie.b3d",
	visual_size = { x = 1.0, y = 1.0 },
	textures = {
		{ "texturezombie.png" },
	},
	sounds = {
		attack = "people_zombie4",
		random = "people_zombie",
		damage = "people_zombie2",
		death = "people_zombie3",
		distance = 15,
	},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 3,
	walk_chance = 10,
	runaway = false,
	jump = true,
	jump_height = 4,
	stay_near = { { "people:weaponstand" }, 4 },
	drops = {
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 2,
	animation = {
		speed_normal = 60,
		stand_speed = 50,
		stand_start = 300,
		stand_end = 400,
		walk_start = 100,
		walk_end = 200,
		walk2_start = 200,
		walk2_end = 300,
		punch_start = 0,
		punch_end = 100,
		die_start = 0,
		die_end = 100,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},
	view_range = 150,

	on_rightclick = function(self, clicker)
		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end
	end,
})

-- if not mobs.custom_spawn_people then
mobs:spawn({
	name = "people:zombieinstructor",
	nodes = { "mcl_core:stone" },
	neighbors = { "people:instructorgrave" },
	min_light = 0,
	interval = 30,
	active_object_count = 2,
	chance = 10, -- 15000
	min_height = -25,
	max_height = 1000,
	day_toggle = false
})

mobs:register_egg("people:zombieinstructor", S("Zombie"), "azombie.png")
