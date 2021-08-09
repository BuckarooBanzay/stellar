
local map

function stellar.ships.hyperion.update_navigation()
end

lua_trigger.register_periodic_trigger("hyperion_navigation", function(pos)
    if map and map:is_active() then
        -- already active/valid
        return
    end

    map = starmap.new(pos)

    map:add_text({x=-0.5, y=4, z=0}, {
        text = "Navigation",
        color = "#0000FF",
        glow = 14,
        yaw = math.pi/2
    })
end)