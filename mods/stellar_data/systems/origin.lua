
stellar.register_system("origin", {
    rings = {
        { radius = 4 },
        { radius = 5, color = "#00FF00" },
        { radius = 2, color = "#0000FF", position = {x=0, z=5} }
    },
    planets = {
        {
            texture = "default_lava.png",
            position = {x=0, z=0},
            size = 2,
            automatic_rotate = 0.1,
            glow = 14,
        },{
            name = "Hoth",
            position = {x=0, z=5},
            texture = "default_snow.png",
            size = 1,
            automatic_rotate = 1,
            glow = 14
        },{
            name = "Arrakis",
            position = {x=4, z=0},
            texture = "default_sand.png",
            size = 1.5,
            automatic_rotate = 0.3,
            glow = 14
        },{
            name = "Unnamed station",
            position = {x=2, z=5},
            texture = "scifi_nodes_grey_square.png",
            size = 0.5,
            automatic_rotate = 1,
            glow = 14
        }
    }
})