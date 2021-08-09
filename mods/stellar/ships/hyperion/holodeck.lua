
local map

lua_trigger.register_periodic_trigger("hyperion_holodeck", function(pos)
    if map and map:is_active() then
        -- already active/valid
        return
    end

    minetest.sound_play({ name = "holodeck_click1", gain = 2 }, { pos = pos }, true)
    local ship_status = stellar.get_ship_status()
    if not ship_status.system then
        return
    end

    local system = stellar.get_system(ship_status.system)
    if not system then
        return
    end

    local y_offset = 4

    map = starmap.new(pos)

    local txt = map:add_text({x=0, y=4, z=-5}, {
        text = "Select a planet",
        color = "#0000FF",
        glow = 14
    })


    for _, ring in ipairs(system.rings) do
        local position = ring.position
        if not position then
            -- default to center
            position = { x=0, z=0 }
        end

        local ring_pos = {
            x = position.x,
            y = y_offset,
            z = position.z
        }
        map:add_ring(ring_pos, {
            radius = ring.radius,
            color = ring.color
        })
    end

    for _, planet in ipairs(system.planets) do
        local planet_pos = {
            x = planet.position.x,
            y = y_offset,
            z = planet.position.z
        }

        map:add_planet(planet_pos, {
            texture = planet.texture,
            size = planet.size,
            automatic_rotate = planet.automatic_rotate,
            name = planet.name,
            glow = 14,
            on_punch = function(player)
                if not planet.name then
                    return
                end
                minetest.sound_play({
                    name = "holodeck_click2",
                    gain = 2
                }, {
                    to_player = player:get_player_name()
                }, true)

                txt:set_text("Selected:\n" .. planet.name)
                txt:set_color("#00FF00")
                txt:update()
            end
        })

        if planet.key == ship_status.planet then
            -- current position
            map:add_icon(vector.add(planet_pos, {x=0, y=1, z=0}), {
                icon_name = "home2",
                color = "#00FF00"
            })
        end
    end

    map:add_icon({x=-10, y=y_offset, z=0}, {
        icon_name = "tick1",
        on_punch = function()
        end,
        color = "#00FF00",
        yaw = math.pi/2
    })

    map:add_text({x=-10, y=y_offset, z=-3}, {
        text = "Jump",
        yaw = math.pi/2
    })

    map:add_icon({x=-10, y=y_offset+2, z=0}, {
        icon_name = "tick1",
        on_punch = function()
        end,
        color = "#FF0000",
        yaw = math.pi/2
    })

    map:add_text({x=-10, y=y_offset+2, z=-3}, {
        text = "Whatever",
        yaw = math.pi/2
    })

end)