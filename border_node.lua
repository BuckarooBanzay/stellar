
minetest.register_node("stellar:border", {
	description = "Border node",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = 1}
})