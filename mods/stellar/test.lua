
local minpos = { x=0, y=14, z=-120 }
local maxpos = { x=0, y=14, z=-120 }
local minvel = { x=-20, y=-5, z=30 }
local maxvel = { x=20, y=10, z=30 }

local function create_spawner(time, amount, color)
    local texture = "stellar_star1.png"
    if color then
        texture = texture .. "^[colorize:" .. color
    end
    minetest.add_particlespawner({
        amount = amount,
        time = time,
        minpos = minpos,
        maxpos = maxpos,
        minvel = minvel,
        maxvel = maxvel,
        minexptime = time,
        maxexptime = time,
        minsize = 0.2,
        maxsize = 1,
        collisiondetection = true,
        collision_removal = true,
        texture = texture,
        glow = 10
    })
end

local function ftl_travel(name)
    local player = minetest.get_player_by_name(name)

    minetest.sound_play({ name = "stellar_hyperdrive_start" }, { to_player = name }, true)

    minetest.after(1.5, function()
        -- fade-in
        player:set_sky({
            base_color = "#FFFFFF",
            type = "plain",
            clouds = false
        })
        local time = 10
        create_spawner(time, 200*time)
        create_spawner(time, 50*time, "#FF0000")
        create_spawner(time, 20*time, "#0000FF")
    end)

    -- travel
    minetest.after(3, function()
        player = minetest.get_player_by_name(name)
        player:set_sky({
            base_color = "#000000",
            type = "plain",
            clouds = false
        })
    end)

    -- fade-out
    minetest.after(13, function()
        minetest.sound_play({ name = "stellar_hyperdrive_stop" }, { to_player = name }, true)

        player = minetest.get_player_by_name(name)
        player:set_sky({
            base_color = "#FFFFFF",
            type = "plain",
            clouds = false
        })
    end)

    -- restore
    minetest.after(14, function()
        player = minetest.get_player_by_name(name)
        -- TODO: do this with a helper-function form the "skybox" mod
        player:set_clouds({ density=0 })
        player:set_sky({r=0, g=0, b=0}, "skybox", {
          "sky_pos_z.png",
          "sky_neg_z.png^[transformR180",
          "sky_neg_y.png^[transformR270",
          "sky_pos_y.png^[transformR270",
          "sky_pos_x.png^[transformR270",
          "sky_neg_x.png^[transformR90"
        })
    end)
end

minetest.register_chatcommand("travel1", {
    func = ftl_travel
})

local function sublight_travel()
    local time = 20
    minetest.add_particlespawner({
        amount = 200*time,
        time = time,
        minpos = vector.subtract(minpos, {x=30, y=30, z=0}),
        maxpos = vector.add(maxpos, {x=30, y=30, z=0}),
        minvel = {x=0, y=0, z=30},
        maxvel = {x=0, y=0, z=30},
        minexptime = time,
        maxexptime = time,
        minsize = 0.5,
        maxsize = 1.5,
        collisiondetection = true,
        collision_removal = true,
        texture = "default_stone.png",
        glow = 10
    })
end


minetest.register_chatcommand("travel2", {
    func = sublight_travel
})