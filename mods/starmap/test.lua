
minetest.register_chatcommand("starmap", {
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if not player then
            return
        end
        local ppos = player:get_pos()

        local map = starmap.new(ppos)
        local txt = map:add_text({x=-2, y=0, z=0}, {
            text = "Select a planet",
            color = "#0000FF"
        })

        map:add_planet({x=0, y=0, z=2}, {
            texture = "default_grass.png",
            size = 1,
            automatic_rotate = 1,
            name = "Hoth",
            on_punch = function()
                txt:set_text("Selected:\nHoth")
                txt:set_color("#00FF00")
                txt:update()
            end
        })
        map:add_planet({x=2, y=0, z=0}, {
            texture = "default_sand.png",
            size = 1.5,
            automatic_rotate = 0.3,
            name = "Arrakis",
            on_punch = function()
                txt:set_text("Selected:\nArrakis")
                txt:set_color("#FF0000")
                txt:update()
            end
        })
    end
})

minetest.register_chatcommand("starmap2", {
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if not player then
            return
        end
        local ppos = player:get_pos()

        local map = starmap.new(ppos)
        local e
        e = map:add_text({x=0, y=0, z=2}, {
            text = "Lorem ipsum dolor sit amet,\n" ..
                "consetetur sadipscing elitr,\n" ..
                "sed diam nonumy eirmod tempor \n" ..
                "invidunt ut labore et dolore magna ",
            color = "#0000FF",
            on_punch = function()
                e:set_yaw(math.random() * math.pi)
            end
        })
    end
})