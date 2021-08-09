stellar = {
    storage = minetest.get_mod_storage()
}

local MP = minetest.get_modpath("stellar")
dofile(MP.."/system.lua")
dofile(MP.."/ship.lua")
dofile(MP.."/skybox.lua")
dofile(MP.."/test.lua")
