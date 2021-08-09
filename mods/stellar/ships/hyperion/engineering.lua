
local map

lua_trigger.register_periodic_trigger("hyperion_engineering", function(pos)
    if map and map:is_active() then
        -- already active/valid
        return
    end

    local ship_status = stellar.get_ship_status()

    map = starmap.new(pos)

    map:add_text({x=0.5, y=4, z=0}, {
        text = "Power:",
        color = "#0000FF",
        glow = 14,
        yaw = math.pi/2
    })
end)
