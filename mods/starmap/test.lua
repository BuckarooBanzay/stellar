
minetest.register_chatcommand("starmap", {
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if not player then
            return
        end
        local ppos = player:get_pos()

        local map = starmap.new(ppos)
        map:add_planet({x=0, y=0, z=2}, {
            texture = "default_grass.png",
            size = 1,
            automatic_rotate = 1,
            name = "Hoth"
        })
        map:add_planet({x=2, y=0, z=0}, {
            texture = "default_sand.png",
            size = 1.5,
            automatic_rotate = 0.3,
            name = "Arrakis"
        })
        local txt = map:add_text({x=-2, y=0, z=0}, {
            text = "Space stuff",
            color = "#0000FF"
        })

        minetest.after(2, function()
            txt:set_text("Other stuff")
            txt:set_color("#00FF00")
            txt:update()
        end)
    end
})