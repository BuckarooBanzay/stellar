
lua_trigger.register_periodic_trigger("origin_teleporter", function(pos)
    local texture = "stellar_star1.png^[colorize:#EE82EE"
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