local S = minetest.get_translator("people")

minetest.register_node("people:weaponstand", {
    description = S"Weaponstand",
    visual_scale = 1,
    mesh = "Weaponstand.b3d",
    tiles = {"textureweaponstand.png"},
    inventory_image = "aweaponstand.png",
    paramtype = "light",
    paramtype2 = "facedir",
    walkable = false,
    groups = {choppy = 3},
    drawtype = "mesh",
		collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.4, 0.4},
    sounds = mcl_sounds.node_sound_wood_defaults()
})

minetest.register_craft({
	type = "cooking",
	output = "mcl_core:steel_ingot",
	recipe = "people:weaponstand",
})