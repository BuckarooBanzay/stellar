stellar = {
    storage = minetest.get_mod_storage()
}

local MP = minetest.get_modpath("stellar")
dofile(MP.."/spawn.lua")
dofile(MP.."/system.lua")
dofile(MP.."/ship.lua")
dofile(MP.."/skybox.lua")

dofile(MP.."/ships/hyperion/holodeck.lua")
dofile(MP.."/ships/hyperion/teleporter.lua")

dofile(MP.."/systems/helios.lua")

dofile(MP.."/test.lua")