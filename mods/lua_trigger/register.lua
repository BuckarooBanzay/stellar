
if minetest.get_modpath("default") then
    lua_trigger.register_node("default:stone")
    lua_trigger.register_node("default:cobble")
end

if minetest.get_modpath("scifi_nodes") then
    lua_trigger.register_node("scifi_nodes:white2")
    lua_trigger.register_node("scifi_nodes:white")
end

lua_trigger.register_trigger("debug", function(pos, channel, msg)
    minetest.log("action", "[lua_trigger] triggered at " ..
        minetest.pos_to_string(pos) .. " channel: " .. (channel or "<none>") ..
        " message: " .. dump(msg)
    )
end)