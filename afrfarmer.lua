local S = minetest.get_translator("people")


mobs.afrfarmer_drops = {
	"people:dog", "people:goat", "people:dogfoodsack", "people:ridepig", "people:rideostrich", "people:plough"
}

mobs:register_mob("people:afrfarmer", {
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
	mesh = "Medfarmer.b3d",
	textures = {
		{ "textureafrfarmer.png" },

	},
	makes_footstep_sound = true,
	sounds = {
		random = "people_farmerm",
		damage = "people_male5",
		death = "people_maledeath",
		distance = 10,
	},
	walk_velocity = 1.5,
	run_velocity = 2,
	stepheight = 1,
	fear_height = 2,
	jump = true,
	jump_height = 3,
	stay_near = { { "people:feeder", "people:villagerbed", "mcl_books:bookshelf",
		"mcl_itemframes:item_frame", "mcl_lanterns:lantern", "mcl_lanterns:soul_lantern",
		"mcl_candles:candle", "mcl:bookcase", "xdecor:tv", "mcl_books:bookshelf",
		"mcl_boats:chest_boat", "livingcaves:root_lamp", "mcl_chests:chest", "mcl_core:mese_post_light_pine_wood",
		"mcl_nether:glowstone", "mcl_core:mese_post_light_pine_wood", "mcl_core:mese_post_light",
		"mcl_trees:wood_acacia", "mcl_core:mese_post_light_aspen_wood", "mcl_core:mese_post_light_junglewood",
		"animalworld:crocodilestool", "animalworld:elephantstool", "animalworld:bearstool", "animalworld:gnustool",
		"animalworld:hippostool", "animalworld:monitorstool", "animalworld:ivorychair", "animalworld:sealstool",
		"animalworld:yakstool", "animalworld:tigerstool", "animalworld:muskoxstool" }, 4 },
	drops = { { name = "people:farmergrave", chance = 1, min = 1, max = 1 },
	},
	water_damage = 1,
	lava_damage = 3,
	light_damage = 0,
	follow = { "mcl_core:coal_lump" },
	view_range = 15,
	runaway_from = {
		"mobs_mc:zombie",
		"mobs_mc:baby_zombie",
		"mobs_mc:husk",
		"mobs_mc:baby_husk",
		"mobs_mc:villager_zombie",
		"mobs_mc:zombified_piglin",
		"mobs_mc:zoglin",
		"mobs_mc:pillager",
		"mobs_mc:vindicator",
		"mobs_mc:vex",
		"mobs_mc:evoker",
		"mobs_mc:illusioner",
	},
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
		die_rotate = true,
	},
	-- right clicking with raw meat will give Igor more health
	on_rightclick = function(self, clicker)
		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end

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

			local drops = self.afrfarmer_drops or mobs.afrfarmer_drops

			minetest.add_item(pos, {
				name = drops[math.random(1, #drops)]
			})

			minetest.chat_send_player(name, S("Farmer dropped you an item for gold!"))

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

				minetest.chat_send_player(name, S("Farmer stands still."))
			else
				self.order = "follow"
				minetest.chat_send_player(name, S("Farmer will follow you."))
			end
		end
	end,
})



--end
-- register spawn egg
mobs:register_egg("people:afrfarmer", S("Farmer Acacia"), "aafrfarmer.png")
