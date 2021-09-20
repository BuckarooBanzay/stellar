local MP = minetest.get_modpath(minetest.get_current_modname())

local function readvalues(filename)
	local file, err = io.open(filename,"r")
	if file then
		local txt = file:read("*a")
		local result = {}
		for entry in string.gmatch(txt, "([^,]+)") do
			table.insert(result, entry)
		end
		return result
	else
		error("read error", err)
	end
end

local prefixes = readvalues(MP .. "/dict/planet_prefixes.txt")
local suffixes = readvalues(MP .. "/dict/planet_suffixes.txt")

function stellar_planets.generate_planet_name()
    return prefixes[math.random(#prefixes)] .. " " .. suffixes[math.random(#suffixes)]
end