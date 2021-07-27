
globals = {
	"lua_trigger"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"vector", "ItemStack",
	"dump",
	"minetest",

	-- optional deps
	"default",
	"mesecon"
}
