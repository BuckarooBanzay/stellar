globals = {
	"stellar_nodes"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"vector", "ItemStack",
	"dump",
	"minetest",
	"stellar",

	-- Testing
	"mineunit",
	"sourcefile"
}
