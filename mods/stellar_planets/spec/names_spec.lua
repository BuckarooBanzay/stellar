require("mineunit")

mineunit("core")
mineunit("default/functions")

sourcefile("init")

describe("stellar_planets.generate_planet_name", function()
	it("returns proper names", function()
        print(stellar_planets.generate_planet_name())
	end)
end)