
local skyboxes = {
    ["space"] = {
        "sky_pos_z.png",
        "sky_neg_z.png^[transformR180",
        "sky_neg_y.png^[transformR270",
        "sky_pos_y.png^[transformR270",
        "sky_pos_x.png^[transformR270",
        "sky_neg_x.png^[transformR90"
    },
    ["arid2"] = {
        "arid2_up.jpg",
        "arid2_dn.jpg",
        "arid2_rt.jpg",
        "arid2_lf.jpg",
        "arid2_ft.jpg",
        "arid2_bk.jpg"
    },
    ["desertdawn"] = {
        "desertdawn_up.jpg",
        "desertdawn_dn.jpg",
        "desertdawn_rt.jpg",
        "desertdawn_lf.jpg",
        "desertdawn_ft.jpg",
        "desertdawn_bk.jpg"
    },
    ["dusk"] = {
        "dusk_up.jpg",
        "dusk_dn.jpg",
        "dusk_rt.jpg",
        "dusk_lf.jpg",
        "dusk_ft.jpg",
        "dusk_bk.jpg"
    },
    ["vulcan"] = {
        "vulcan_up.jpg",
        "vulcan_dn.jpg",
        "vulcan_rt.jpg",
        "vulcan_lf.jpg",
        "vulcan_ft.jpg",
        "vulcan_bk.jpg"
    }
}

minetest.register_chatcommand("skybox", {
    func = function(name, skybox_name)
        local textures = skyboxes[skybox_name]
        if not textures then
            return false, "skybox not found"
        end

        local player = minetest.get_player_by_name(name)
        player:set_sky({r=0, g=0, b=0}, "skybox", textures)

        return true, "skybox set to: " .. skybox_name
    end
})

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

    local textures = skyboxes[system.skybox]
    if not textures then
        return
    end

    player:set_sky({r=0, g=0, b=0}, "skybox", textures)
end

minetest.register_on_joinplayer(stellar.reset_skybox)
