local MP = minetest.get_modpath("stellar") .. "/ships/hyperion"

stellar.ships.hyperion = {}

dofile(MP.."/navigation.lua")
dofile(MP.."/starmap.lua")
dofile(MP.."/teleporter.lua")
