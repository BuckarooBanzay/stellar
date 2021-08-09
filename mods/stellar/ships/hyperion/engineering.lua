
local map

lua_trigger.register_periodic_trigger("hyperion_engineering", function(pos)
    if map and map:is_active() then
        -- already active/valid
        return
    end

    local ship_status = stellar.get_ship_status()

    map = starmap.new(pos)

    local percent_power = tonumber(ship_status.power / ship_status.power_max * 100)

    map:add_text({x=0.5, y=4, z=0}, {
        text = "Power:\n" ..
            ship_status.power .. " / " .. ship_status.power_max .. " GWh " ..
            "(" .. percent_power .. "%)",
        color = "#0000FF",
        glow = 14,
        yaw = math.pi/2
    })
end)
