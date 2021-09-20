stellar = {
    storage = minetest.get_mod_storage()
}

local MP = minetest.get_modpath(minetest.get_current_modname())
dofile(MP.."/functions.lua")
dofile(MP.."/spawn.lua")
dofile(MP.."/mapgen.lua")
