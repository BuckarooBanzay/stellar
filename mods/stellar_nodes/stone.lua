local S = minetest.get_translator(minetest.get_current_modname())
-- XXX Testing code

minetest.register_node("stellar_nodes:stone", {
	description = S("Stone"),
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1}
})

minetest.register_node("stellar_nodes:stone2", {
	description = S("Stone"),
	tiles = {"default_stone.png^[colorize:#0000FF:20"},
	groups = {cracky = 3, stone = 1}
})
