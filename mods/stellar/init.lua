stellar = {
    storage = minetest.get_mod_storage()
}

local MP = minetest.get_modpath("stellar")
dofile(MP.."/events.lua")
dofile(MP.."/spawn.lua")
dofile(MP.."/system.lua")
dofile(MP.."/ship.lua")
dofile(MP.."/skybox.lua")

stellar.ships = {}
dofile(MP.."/ships/hyperion/init.lua")

dofile(MP.."/systems/helios.lua")

dofile(MP.."/test.lua")
