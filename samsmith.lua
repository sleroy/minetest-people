local S = minetest.get_translator("people")


mobs.samsmith_drops = {
	"mcl_tools:axe_iron", "mcl_tools:axe_iron", "mcl_tools:axe_iron",
	"mcl_tools:axe_iron", "mcl_tools:axe_stone", "mcl_tools:axe_stone",
	"mcl_tools:axe_diamond", "mcl_tools:axe_diamond", "mcl_tools:pick_bronze", "mcl_tools:pick_bronze",
	"mcl_tools:pick_iron", "mcl_tools:pick_iron", "mcl_tools:pick_wood", "mcl_tools:pick_wood",
	"mcl_tools:pick_gold", "mcl_tools:pick_gold",
	"mcl_tools:shovel_bronze", "mcl_tools:shovel_bronze",
	"mcl_tools:shovel_iron", "mcl_tools:shovel_iron",
	"mcl_tools:shovel_silver", "mcl_tools:shovel_silver",
	"mcl_tools:shovel_diamond", "mcl_tools:shovel_diamond ",
	"mcl_tools:sword_bronze", "mcl_tools:sword_bronze", "mcl_tools:sword_iron",
	"mcl_tools:sword_iron", "mcl_tools:sword_wood", "mcl_tools:sword_wood",
	"mcl_tools:sword_diamond", "mcl_tools:sword_diamond"
}

mobs:register_mob("people:samsmith", {
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
	mesh = "Medsmith2.b3d",
	textures = {
		{ "texturesamsmith.png" },

	},
	makes_footstep_sound = true,
	sounds = {
		random = "people_smith",
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
	stay_near = { { "people:forge", "people:villagerbed", "mcl_books:bookshelf", "mcl_itemframes:item_frame", "mcl_lanterns:lantern", "mcl_lanterns:soul_lantern", "mcl_candles:candle", "mcl:bookcase", "xdecor:tv", "mcl_books:bookshelf", "mcl_boats:chest_boat", "livingcaves:root_lamp", "mcl_chests:chest", "mcl_core:mese_post_light_pine_wood", "mcl_nether:glowstone", "mcl_core:mese_post_light_pine_wood", "mcl_core:mese_post_light", "mcl_trees:wood_acacia", "mcl_core:mese_post_light_aspen_wood", "mcl_core:mese_post_light_junglewood", "animalworld:crocodilestool", "animalworld:elephantstool", "animalworld:bearstool", "animalworld:gnustool", "animalworld:hippostool", "animalworld:monitorstool", "animalworld:ivorychair", "animalworld:sealstool", "animalworld:yakstool", "animalworld:tigerstool", "animalworld:muskoxstool" }, 4 },
	drops = { { name = "people:smithgrave", chance = 1, min = 1, max = 1 },
	},
	water_damage = 1,
	lava_damage = 3,
	light_damage = 0,
	follow = { "mcl_core:diamond" },
	view_range = 15,
	owner = "",
	order = "follow",
	follow = { "mcl_farming:potato_item", "mcl_farming:carrot_item", "mcl_farming:beetroot_item", "mcl_farming:bread", "mcl_farming:beetroot_soup", "pie:brpd_0", "mcl_farming:bread", "mcl_farming:wheat_seeds", "mcl_farming:cookie", "mcl_farming:beetroot_soup", "mcl_farming:pumpkin_pie", "mcl_farming:porridge", "mcl_farming:bibimbap", "mcl_farming:bread", "mcl_farming:paella", "mcl_farming:mac_and_cheese", "livingcaves:healingsoup", "mcl_farming:melon_item", "animalworld:escargots", "mcl_farming:rhubarb_pie", "mcl_farming:potato_omlet", "mcl_farming:potato_salad" },
	-- model animation
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

			local drops = self.samsmith_drops or mobs.samsmith_drops

			minetest.add_item(pos, {
				name = drops[math.random(1, #drops)]
			})

			minetest.chat_send_player(name, S("Blackmith dropped you an item for gold!"))

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

				minetest.chat_send_player(name, S("Blacksmith stands still."))
			else
				self.order = "follow"
				minetest.chat_send_player(name, S("Blacksmith will follow you."))
			end
		end
	end,
})

-- register spawn egg
mobs:register_egg("people:samsmith", S("Blacksmith Jungle"), "asamsmith.png")

-- compatibility
mobs:alias_mob("people:samsmith", "people:samsmith")
