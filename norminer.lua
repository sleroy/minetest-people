
local S = minetest.get_translator("people")


mobs.norminer_drops = {
"mcl_copper:copper_ingot", "moreores:tin_ingot", "mcl_core:iron_ingot", 
"mcl_core:gold_ingot", "mcl_core:diamond", "mcl_copper:copper_ingot",
"mcl_core:iron_ingot", "moreores:tin_ingot", "mcl_copper:copper_ingot", "moreores:tin_ingot", "mcl_core:iron_ingot", 
"mcl_core:gold_ingot"
}

mobs:register_mob("people:norminer", {
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
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "Miner.b3d",
	textures = {
		{"texturenorminer.png"},

	},
	makes_footstep_sound = true,
sounds = {		random = "people_miner",
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
        stay_near = {{"people:mineshaft", "people:villagerbed", "mcl_books:bookshelf", "mcl_itemframes:item_frame","mcl_lanterns:lantern", "mcl_lanterns:soul_lantern", "mcl_candles:candle", "mcl:bookcase", "xdecor:tv", "mcl_books:bookshelf", "mcl_boats:chest_boat", "livingcaves:root_lamp", "mcl_chests:chest", "mcl_core:mese_post_light_pine_wood", "mcl_nether:glowstone", "mcl_core:mese_post_light_pine_wood", "mcl_core:mese_post_light", "mcl_trees:wood_acacia", "mcl_core:mese_post_light_aspen_wood", "mcl_core:mese_post_light_junglewood", "animalworld:crocodilestool", "animalworld:elephantstool", "animalworld:bearstool", "animalworld:gnustool", "animalworld:hippostool", "animalworld:monitorstool", "animalworld:ivorychair", "animalworld:sealstool", "animalworld:yakstool", "animalworld:tigerstool", "animalworld:muskoxstool"}, 4},
	drops = {		{name = "people:minergrave", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 3,
	light_damage = 0,
	follow = {"mcl_armor:helmet_chain", "mcl_torches:torch"},
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
		if item:get_name() == "mcl_farming:turkish_delight" or item:get_name() == "mcl_farming:donut_apple" or item:get_name() == "mcl_farming:porridge" or item:get_name() == "mcl_farming:jaffa_cake" or item:get_name() == "mcl_farming:apple_pie" or item:get_name() == "mcl_farming:melon_item" or item:get_name() == "mcl_farming:bread" or item:get_name() == "mcl_farming:bibimbap" or item:get_name() == "mcl_farming:potato_item" or item:get_name() == "mcl_farming:carrot_item" or item:get_name() == "mcl_farming:beetroot_item" or item:get_name() == "mcl_farming:bread" or item:get_name() == "mcl_farming:beetroot_soup" or item:get_name() == "pie:brpd_0" or item:get_name() == "mcl_farming:bread" or item:get_name() == "mcl_farming:wheat_seeds" or item:get_name() == "mcl_farming:cookie" or item:get_name() == "mcl_farming:beetroot_soup" or item:get_name() == "mcl_farming:mcl_farming:pumpkin_pie" or item:get_name() == "mcl_farming:porridge" or item:get_name() == "mcl_farming:bibimbap" or item:get_name() == "mcl_farming:bread" or item:get_name() == "mcl_farming:paella" or item:get_name() == "mcl_farming:mac_and_cheese" or item:get_name() == "livingcaves:healingsoup" or item:get_name() == "mcl_farming:melon_item" or item:get_name() == "animalworld:escargots" or item:get_name() == "mcl_farming:rhubarb_pie" or item:get_name() == "mcl_farming:potato_omlet" or item:get_name() == "mcl_farming:potato_salad" then

			if not mobs.is_creative(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:get_pos()

			pos.y = pos.y + 0.5

			local drops = self.norminer_drops or mobs.norminer_drops

			minetest.add_item(pos, {
				name = drops[math.random(1, #drops)]
			})

			minetest.chat_send_player(name, S("Miner dropped you an item for food!"))

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

				minetest.chat_send_player(name, S("Miner stands still."))
			else
				self.order = "follow"
				minetest.chat_send_player(name, S("Miner will follow you."))
			end
		end
	end,
})

if not mobs.custom_spawn_people then
mobs:spawn({
	name = "people:norminer",
	nodes = {"mcl_core:pine_wood"},
	neighbors = {"people:mineshaft"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	min_height = -25,
	max_height = 1000,
})
end
-- register spawn egg
mobs:register_egg("people:norminer", S("Miner Pine"), "anorminer.png")

-- compatibility
mobs:alias_mob("people:norminer", "people:norminer")
