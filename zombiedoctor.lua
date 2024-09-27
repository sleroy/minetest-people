local S = minetest.get_translator("people")

mobs:register_mob("people:zombiedoctor", {
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
    visual_size = {
        x = 1.0,
        y = 1.0
    },
    textures = { { "texturezombie.png" } },
    sounds = {
        attack = "people_zombie4",
        random = "people_zombie",
        damage = "people_zombie2",
        death = "people_zombie3",
        distance = 15
    },
    makes_footstep_sound = true,
    walk_velocity = 1,
    run_velocity = 3,
    walk_chance = 10,
    runaway = false,
    jump = true,
    jump_height = 4,
    stay_near = { { "people:firstaidnode" }, 4 },
    drops = { "mcl_torches:torch", "mcl_armor:helmet_chain", "mcl_farming:carrot_item_gold", "people:firsaidkit",
        "mcl_potions:glass_bottle", "mcl_potions:water_breathing", "mcl_potions:fire_resistance",
        "mcl_potions:healing", "mcl_potions:swiftness" },
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
        die_rotate = true
    },
    view_range = 150,

    on_rightclick = function(self, clicker)
        -- feed or tame
        if mobs:feed_tame(self, clicker, 4, false, true) then
            return
        end
        if mobs:protect(self, clicker) then
            return
        end
        if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then
            return
        end
    end
})

-- if not mobs.custom_spawn_people then
mobs:spawn({
    name = "people:zombiedoctor",
    nodes = { "mcl_wool:white_carpet", "mcl_core:stonebrick", "mcl_core:cobble", "mcl_wool:brown_carpet",
        "mcl_wool:silver_carpet", "mcl_wool:silver_carpet",
        "mcl_wool:grey_carpet", "mcl_wool:blue_carpet", "mcl_wool:green_carpet",
        "mcl_wool:green_carpetmcl_wool:lime_carpet", "mcl_wool:purple_carpet", "mcl_wool:pink_carpet",
        "mcl_wool:yellow_carpet", "mcl_wool:orange_carpet", "mcl_wool:red_carpet", "mcl_wool:cyan_carpet",
        "mcl_wool:magenta_carpet", "mcl_wool:black_carpet", "mcl_wool:light_blue_carpet", "mcl_trees:tree_birch",
        "mcl_trees:tree_dark_oak", "mcl_trees:tree_acacia", "mcl_trees:tree_jungle", "mcl_trees:tree_spruce",
        "mcl_trees:tree_oak", "mcl_trees:tree_oak", "mcl_trees:tree_mangrove", "mcl_trees:tree_crimson",
        "mcl_trees:tree_warped", "mcl_trees:tree_bamboo", "mcl_trees:tree_cherry_blossom", "mcl_core:stonebrick",
        "mcl_core:cobble",
        "mcl_trees:wood_birch", "mcl_trees:wood_dark_oak", "mcl_trees:wood_dark_oak", "mcl_trees:wood_acacia" },
    neighbors = { "people:doctorgrave" },
    min_light = 0,
    interval = 30,
    active_object_count = 2,
    chance = 10, -- 15000
    min_height = -25,
    max_height = 1000,
    day_toggle = false
})


mobs:register_egg("people:zombiedoctor", S("Zombie"), "azombie.png")
