
local map

lua_trigger.register_trigger("origin_holodeck", function(pos)
    if map and map:is_active() then
        -- already active/valid
        return
    end

    map = starmap.new(pos)

    map:add_planet({x=0, y=2, z=0}, {
        texture = "default_lava.png",
        size = 2,
        automatic_rotate = 0.1,
        glow = 14,
    })

    map:add_ring({x=0, y=2, z=0}, {
        radius = 4
    })

    map:add_ring({x=0, y=2, z=0}, {
        radius = 5,
        color = "#00FF00"
    })

    local txt = map:add_text({x=0, y=4, z=-5}, {
        text = "Select a planet",
        color = "#0000FF",
        glow = 14
    })

    map:add_planet({x=0, y=2, z=5}, {
        texture = "default_grass.png",
        size = 1,
        automatic_rotate = 1,
        name = "Hoth",
        glow = 14,
        on_punch = function()
            txt:set_text("Selected:\nHoth")
            txt:set_color("#00FF00")
            txt:update()
        end
    })

    map:add_ring({x=0, y=2, z=5}, {
        radius = 2,
        color = "#0000FF"
    })

    map:add_planet({x=2, y=2, z=5}, {
        texture = "scifi_nodes_grey_square.png",
        size = 0.5,
        automatic_rotate = 1,
        name = "Unnamed station",
        glow = 14,
        on_punch = function()
            txt:set_text("Selected:\nUnnamed station")
            txt:set_color("#0000FF")
            txt:update()
        end
    })

    map:add_planet({x=4, y=2, z=0}, {
        texture = "default_sand.png",
        size = 1.5,
        automatic_rotate = 0.3,
        name = "Arrakis",
        glow = 14,
        on_punch = function()
            txt:set_text("Selected:\nArrakis")
            txt:set_color("#FF0000")
            txt:update()
        end
    })
end)