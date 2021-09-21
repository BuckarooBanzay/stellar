globals = {
	"stellar_mapgen"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"vector", "ItemStack",
	"dump", "VoxelArea",
	"minetest",
	"stellar",

	-- Testing
	"mineunit",
	"sourcefile"
}
