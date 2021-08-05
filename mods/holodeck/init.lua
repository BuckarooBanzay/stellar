
local map

lua_trigger.register_trigger("origin_holodeck", function(pos)
    if map and map:is_active() then
        -- already active/valid
        return
    end

    local system = stellar.get_system("origin")
    if not system then
        return
    end

    local y_offset = 2

    map = starmap.new(pos)

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

        map:add_planet(planet_pos, planet)
    end

end)