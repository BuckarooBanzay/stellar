
local hyperion_teleporter_pos = {x=12, y=14, z=-51}

local function teleporter_animation(pos)
    local texture = "stellar_star1.png^[colorize:#9A32CD"
    minetest.add_particlespawner({
        amount = 50,
        time = 1,
        minpos = vector.add(pos, {x=-1, y=0.5, z=-1}),
        maxpos = vector.add(pos, {x=1, y=0.5, z=1}),
        minvel = {x=0, y=0.5, z=0},
        maxvel = {x=0, y=1, z=0},
        minexptime = 4,
        maxexptime = 3,
        minsize = 0.2,
        maxsize = 1,
        texture = texture,
        glow = 10
    })
end

-- playername -> os.time()
local debounce_table = {}
local debounce_time = 5

local function teleport_near_players(source_pos, target_pos)
    local now = os.time()

    for _, player in ipairs(minetest.get_connected_players()) do
        local ppos = player:get_pos()
        local name = player:get_player_name()
        local debounced = not debounce_table[name] or debounce_table[name] < (now - debounce_time)
        if vector.distance(ppos, source_pos) < 2 and debounced then
            -- player is near the source_pos
            player:set_pos(vector.add(target_pos, {x=0, y=0.5, z=0}))
            player:set_look_horizontal(player:get_look_horizontal() + math.pi)
            debounce_table[name] = now
        end
    end
end

lua_trigger.register_periodic_trigger("hyperion_teleporter", function(pos)
    local planet = stellar.get_current_planet()
    if not planet or not planet.teleporter then
        -- ship not near any planet
        return
    end

    -- TODO: add holografic target name to teleporter

    teleporter_animation(pos)
    teleport_near_players(pos, planet.teleporter)
end)

lua_trigger.register_periodic_trigger("hyperion_return_teleporter", function(pos)
    local planet = stellar.get_current_planet()
    if not planet or not planet.teleporter or not vector.equals(planet.teleporter, pos) then
        -- ship not near the planet
        return
    end

    teleporter_animation(pos)
    teleport_near_players(pos, hyperion_teleporter_pos)
end)