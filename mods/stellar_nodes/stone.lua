local S = minetest.get_translator(minetest.get_current_modname())
-- XXX Testing code

for _, name in ipairs({"stone", "dirt", "cobble", "sand", "sandstone"}) do

    minetest.register_node("stellar_nodes:" .. name, {
        description = S(name),
        tiles = {"stellar_nodes_" .. name .. ".png"},
        groups = {cracky = 3, stone = 1}
    })

    minetest.register_node("stellar_nodes:" .. name .. "2", {
        description = S(name),
        tiles = {"stellar_nodes_" .. name .. ".png^[colorize:#0000AA:50"},
        groups = {cracky = 3, stone = 1}
    })
end

minetest.register_node("stellar_nodes:dirt_with_grass", {
    description = S("Dirt with grass"),
    tiles = {
        "stellar_nodes_grass.png",
        "stellar_nodes_dirt.png",
        {name = "stellar_nodes_dirt.png^(stellar_nodes_grass_side.png)", tileable_vertical = false}
    },
    groups = {crumbly=1, oddly_breakable_by_hand=1, soil=1}
})

minetest.register_node("stellar_nodes:dirt_with_grass2", {
    description = S("Dirt with grass 2"),
    tiles = {
        "stellar_nodes_grass.png^[colorize:cyan:80",
        "stellar_nodes_dirt.png",
        {name = "stellar_nodes_dirt.png^(stellar_nodes_grass_side.png^[colorize:cyan:80)", tileable_vertical = false}
    },
    groups = {crumbly=1, oddly_breakable_by_hand=1, soil=1}
})


minetest.register_node("stellar_nodes:water_source", {
	description = S("Water Source"),
	drawtype = "liquid",
	waving = 3,
	tiles = {
		{
			name = "stellar_nodes_water_source_animated.png^[colorize:#AA0000:50",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "stellar_nodes_water_source_animated.png^[colorize:#AA0000:50",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "stellar_nodes:water_flowing",
	liquid_alternative_source = "stellar_nodes:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1},
})

minetest.register_node("stellar_nodes:water_flowing", {
	description = S("Flowing Water"),
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"stellar_nodes_water.png"},
	special_tiles = {
		{
			name = "stellar_nodes_water_flowing_animated.png^[colorize:#AA0000:50",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "stellar_nodes_water_flowing_animated.png^[colorize:#AA0000:50",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "stellar_nodes:water_flowing",
	liquid_alternative_source = "stellar_nodes:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
})
