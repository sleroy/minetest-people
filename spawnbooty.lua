local S = minetest.get_translator("people")

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:cobble","mcl_core:mossycobble"},
		sidelen = 16,
		noise_params = {
			offset = -0,
			scale = 0.1,
			spread = {x = 50, y = 50, z = 50},
			seed = 50,
			octaves = 3,
			persist = 1,
		},
		y_max = 1000,
		y_min = -25,
		decoration = "people:bootynode"
	})
