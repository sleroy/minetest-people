local S = minetest.get_translator("people")

mobs.aradoctor_drops = { "mcl_torches:torch", "mcl_armor:helmet_chain", "mcl_farming:carrot_item_gold",
	"people:firsaidkit", "mcl_potions:glass_bottle", "mcl_potions:water_breathing",
	"mcl_potions:fire_resistance", "mcl_potions:healing", "mcl_potions:swiftness" }

mobs:register_mob("people:aradoctor", {
	type = "npc",
	passive = true,
	damage = 5,
	attack_type = "dogfight",
	owner_loyal = true,
	pathfinding = true,
	reach = 2,
	attack_monsters = true,
	attack_animals = false,
	attack_npc = false,
	hp_min = 25,
	hp_max = 35,
	armor = 100,
	collisionbox = { -0.35, -1.0, -0.35, 0.35, 0.8, 0.35 },
	visual = "mesh",
	mesh = "Doctor.b3d",
	textures = { { "texturearadoctor.png" } },
	makes_footstep_sound = true,
	sounds = {
		random = "people_female",
		damage = "people_female5",
		death = "people_femaledeath",
		distance = 10
	},
	walk_velocity = 1.5,
	run_velocity = 2,
	stepheight = 1,
	fear_height = 2,
	jump = true,
	jump_height = 3,
	stay_near = { { "people:firstaidnode", "people:villagerbed", "mcl_books:bookshelf", "mcl_itemframes:item_frame",
		"mcl_lanterns:lantern", "mcl_lanterns:soul_lantern", "mcl_candles:candle", "mcl:bookcase",
		"xdecor:tv", "mcl_books:bookshelf", "mcl_boats:chest_boat", "livingcaves:root_lamp",
		"mcl_chests:chest", "mcl_core:mese_post_light_pine_wood", "mcl_nether:glowstone",
		"mcl_core:mese_post_light_pine_wood", "mcl_core:mese_post_light", "mcl_trees:wood_acacia",
		"mcl_core:mese_post_light_aspen_wood", "mcl_core:mese_post_light_junglewood",
		"animalworld:crocodilestool", "animalworld:elephantstool", "animalworld:bearstool",
		"animalworld:gnustool", "animalworld:hippostool", "animalworld:monitorstool",
		"animalworld:ivorychair", "animalworld:sealstool", "animalworld:yakstool", "animalworld:tigerstool",
		"animalworld:muskoxstool" }, 4 },
	drops = { {
		name = "people:doctorgrave",
		chance = 1,
		min = 1,
		max = 1
	} },
	water_damage = 1,
	lava_damage = 3,
	light_damage = 0,
	follow = { "mcl_farming:mint_tea" },
	view_range = 15,
	owner = "",
	order = "follow",
	-- model animation
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		stand2_start = 100,
		stand2_end = 200,
		walk_speed = 80,
		walk_start = 300,
		walk_end = 400,
		punch_speed = 100,
		punch_start = 200,
		punch_end = 300,
		die_start = 200,
		die_end = 300,
		die_speed = 50,
		die_loop = false,
		die_rotate = true
	},
	-- right clicking with raw meat will give Igor more health
	on_rightclick = function(self, clicker)
		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, false, true) then
			return
		end
		if mobs:protect(self, clicker) then
			return
		end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then
			return
		end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "mcl_core:gold_ingot" then
			if not mobs.is_creative(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:get_pos()

			pos.y = pos.y + 0.5

			local drops = self.aradoctor_drops or mobs.aradoctor_drops

			minetest.add_item(pos, {
				name = drops[math.random(1, #drops)]
			})

			minetest.chat_send_player(name, S("Doctor dropped you an item for gold!"))

			return
		end

		-- if owner switch between follow and stand
		if self.owner and self.owner == name then
			if self.order == "follow" then
				self.attack = nil
				self.order = "stand"
				self.state = "stand"
				self:set_animation("stand")
				self:set_velocity(0)

				minetest.chat_send_player(name, S("Doctor stands still."))
			else
				self.order = "follow"
				minetest.chat_send_player(name, S("Doctor will follow you."))
			end
		end
	end
})

if not mobs.custom_spawn_people then
	mobs:spawn({
		name = "people:aradoctor",
		nodes = { "mcl_wool:white_carpet","mcl_wool:brown_carpet", "mcl_wool:silver_carpet", "mcl_wool:silver_carpet","mcl_wool:grey_carpet", "mcl_wool:blue_carpet","mcl_wool:green_carpet","mcl_wool:green_carpetmcl_wool:lime_carpet", "mcl_wool:purple_carpet", "mcl_wool:pink_carpet", "mcl_wool:yellow_carpet","mcl_wool:orange_carpet","mcl_wool:red_carpet","mcl_wool:cyan_carpet","mcl_wool:magenta_carpet","mcl_wool:black_carpet", "mcl_wool:light_blue_carpet"
		"mcl_trees:tree_birch", "mcl_trees:tree_dark_oak", "mcl_trees:tree_acacia", "mcl_trees:tree_jungle",
			"mcl_trees:tree_spruce", "mcl_trees:tree_oak", "mcl_trees:tree_oak", "mcl_trees:tree_mangrove",
			"mcl_trees:tree_crimson", "mcl_trees:tree_warped", "mcl_trees:tree_bamboo",
			"mcl_trees:tree_cherry_blossom", "mcl_core:stonebrick", "mcl_trees:wood_birch",
			"mcl_trees:wood_dark_oak", "mcl_trees:wood_dark_oak", "mcl_trees:wood_acacia" },
		neighbors = { "people:firstaidnode" },
		min_light = 0,
		interval = 30,
		chance = 1, -- 15000
		min_height = -25,
		max_height = 1000
	})
end
-- register spawn egg
mobs:register_egg("people:aradoctor", S("Doctor Acacia"), "aaradoctor.png")

-- compatibility
mobs:alias_mob("people:aradoctor", "people:aradoctor")
