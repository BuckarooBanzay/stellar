
function stellar.reset_skybox(player)
    if not player then
        return
    end

    player:set_clouds({ density=0 })
    local ship_status = stellar.get_ship_status()
    if not ship_status.system then
        return
    end

    local system = stellar.get_system(ship_status.system)
    if not system or not system.skybox then
        return
    end

    player:set_sky({r=0, g=0, b=0}, "skybox", system.skybox)
end

minetest.register_on_joinplayer(stellar.reset_skybox)
