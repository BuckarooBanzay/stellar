
-- {x=12, y=14, z=-51}

lua_trigger.register_periodic_trigger("hyperion_teleporter", function(pos)
    local ship_status = stellar.get_ship_status()
    if not ship_status.system then
        return
    end

    local planet = stellar.get_current_planet()
    if not planet then
        return
    end

    -- TODO: add holografic target name to teleporter

    local texture = "stellar_star1.png^[colorize:#9A32CD"
    minetest.add_particlespawner({
        amount = 50,
        time = 1,
        minpos = vector.add(pos, {x=-1, y=1, z=-1}),
        maxpos = vector.add(pos, {x=1, y=1, z=1}),
        minvel = {x=0, y=0.5, z=0},
        maxvel = {x=0, y=1, z=0},
        minexptime = 5,
        maxexptime = 4,
        minsize = 0.2,
        maxsize = 1,
        texture = texture,
        glow = 10
    })
end)

lua_trigger.register_periodic_trigger("hyperion_return_teleporter", function(pos)
    local texture = "stellar_star1.png^[colorize:#9A32CD"
    minetest.add_particlespawner({
        amount = 50,
        time = 1,
        minpos = vector.add(pos, {x=-1, y=1, z=-1}),
        maxpos = vector.add(pos, {x=1, y=1, z=1}),
        minvel = {x=0, y=0.5, z=0},
        maxvel = {x=0, y=1, z=0},
        minexptime = 5,
        maxexptime = 4,
        minsize = 0.2,
        maxsize = 1,
        texture = texture,
        glow = 10
    })
end)