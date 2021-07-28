
minetest.register_chatcommand("scene", {
    func = function()
        local s = scene.new()
        s:add_entity()
    end
})