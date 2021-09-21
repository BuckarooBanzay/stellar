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