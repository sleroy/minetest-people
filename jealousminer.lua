local S = minetest.get_translator("people")

mobs:register_mob("people:jealousminer", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
	damage = 4,
	hp_min = 15,
	hp_max = 25,
	armor = 100,
	collisionbox = { -0.35, -1.0, -0.35, 0.35, 0.8, 0.35 },
	visual = "mesh",
	mesh = "Miner.b3d",
	visual_size = { x = 1.0, y = 1.0 },
	textures = {
		{ "texturejealousminer.png" },
	},
	sounds = {
		attack = "people_evilminer2",
		random = "people_evilminer4",
		damage = "people_evilminer",
		death = "people_evilminer3",
		distance = 15,
	},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 3,
	runaway = false,
	jump = true,
	jump_height = 4,
	stay_near = { { "mcl_core:stone_with_coal", "mcl_core:stone_with_copper", " mcl_core:stone_with_tin", "mcl_core:stone_with_iron", "mcl_core:stone_with_gold", "mcl_core:stone_with_mese", "mcl_core:stone_with_diamond" }, 5 },
	drops = {
		{ name = "mcl_copper:copper_ingot", chance = 1, min = 1, max = 1 },
		{ name = "people:emblemoftriumph",  chance = 7, min = 1, max = 1 },
	},
	water_damage = 5,
	lava_damage = 4,
	light_damage = 0,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		stand2_start = 100,
		stand2_end = 200,
		walk_speed = 100,
		walk_start = 200,
		walk_end = 300,
		punch_speed = 100,
		punch_start = 300,
		punch_end = 400,
		die_start = 300,
		die_end = 400,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},
	view_range = 15,
	do_punch = function(self, hitter,
						time_from_last_punch,
						tool_capabilities,
						direction)
		local entity = hitter:get_luaentity()

		print(entity)
		if entity == nil then return true end
		if entity ~= nil and (entity == "people:ewewarrior" or entity.type == "npc")
		then
			return false
		end
	end,
	on_rightclick = function(self, clicker)
		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end
	end,
})

-- if not mobs.custom_spawn_people then
mobs:spawn({
	name = "people:jealousminer",
	nodes = { "mcl_core:stone" },
	neighbors = { "mcl_core:stone_with_coal", "mcl_core:stone_with_copper", "mcl_core:stone", "mcl_core:redandstone" },
	min_light = 0,
	interval = 60,
	chance = 2, -- 15000
	min_height = -100,
	max_height = 0,
})
--end

mobs:register_egg("people:jealousminer", S("Jealous Miner"), "ajealousminer.png")
