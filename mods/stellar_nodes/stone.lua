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
        tiles = {"stellar_nodes_" .. name .. ".png^[colorize:#00FF00:30"},
        groups = {cracky = 3, stone = 1}
    })
end