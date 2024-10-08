local S = minetest.get_translator("people")

minetest.register_node("people:bootynode", {
	description = S "Booty",
	tiles = {
		"people_bootynode_top.png",
		"people_bootynode_bottom.png",
		"people_bootynode_right.png",
		"people_bootynode_left.png",
		"people_bootynode_back.png",
		"people_bootynode_front.png"
	},
	groups = { choppy = 2 },
	drop = "mcl_core:gold_ingot 1",
	sounds = mcl_sounds.node_sound_dirt_defaults(),
})

minetest.register_craft({
	type = "fuel",
	recipe = "people:bootynode",
	burntime = 4,
})
