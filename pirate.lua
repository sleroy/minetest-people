local S = minetest.get_translator("people")

mobs:register_mob("people:pirate", {
	type = "monster",
	passive = false,
	step_height = 2,
	fear_height = 4,
	attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
	damage = 12,
	hp_min = 35,
	hp_max = 75,
	armor = 100,
	collisionbox = { -0.5, -0.01, -0.5, 0.5, 0.95, 0.5 },
	visual = "mesh",
	mesh = "Pirate.b3d",
	visual_size = { x = 1.0, y = 1.0 },
	textures = {
		{ "texturepirate.png" },
	},
	sounds = {
		attack = "people_plundererpirate",
		random = "people_plundererpirate2",
		damage = "people_plundererpirate3",
		death = "people_plundererpirate",
		distance = 15,
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
	walk_chance = 10,
	runaway = false,
	stay_near = { { "people:bootynode" }, 5 },
	jump = true,
	jump_height = 4,
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

	do_punch = function(self, hitter,
						time_from_last_punch,
						tool_capabilities,
						direction)
		-- Prevent friendly fire from killing each other :)
		local entity = hitter:get_luaentity()

		if entity == "people:pirate" then
			return false
		end

		return true
	end,



	on_rightclick = function(self, clicker)
		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end
	end,
})

mobs:register_egg("people:pirate", S("Pirate Plunderer"), "apirate.png")
