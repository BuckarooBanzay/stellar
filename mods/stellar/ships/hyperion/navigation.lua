
local hd

function stellar.ships.hyperion.update_navigation()
end

lua_trigger.register_periodic_trigger("hyperion_navigation", function(pos)
    if hd and hd:is_active() then
        -- already active/valid
        return
    end

    hd = holodeck.new(pos)

    hd:add_text({x=-0.5, y=4, z=0}, {
        text = "Navigation",
        color = "#0000FF",
        glow = 14,
        yaw = math.pi/2
    })
end)