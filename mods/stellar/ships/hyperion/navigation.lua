
-- hash -> ctx
local data = {}

stellar.events.emit("hyperion_navigation_select", function(planet)
    for _, ctx in ipairs(data) do
        ctx.txt:set_text("Selected: " .. planet.name)
    end
end)

local function setup(pos)
    local hd = holodeck.new(pos)

    local txt = hd:add_text({x=-0.5, y=4, z=0}, {
        text = "Navigation",
        color = "#0000FF",
        glow = 14,
        yaw = math.pi/2
    })

    return {
        hd = hd,
        txt = txt
    }
end

lua_trigger.register_periodic_trigger("hyperion_navigation", function(pos)
    local hash = minetest.hash_node_position(pos)
    local ctx = data[hash]
    if not ctx or not ctx.hd:is_active() then
        ctx = setup(pos)
        data[hash] = ctx
    end

end)