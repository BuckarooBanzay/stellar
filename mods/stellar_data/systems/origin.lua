
stellar.register_system("origin", {
    rings = {
        { radius = 4 },
        { radius = 6, color = "#00FF00" },
        { radius = 2, color = "#0000FF", position = {x=0, z=6} }
    },
    skybox = {
        "sky_pos_z.png",
        "sky_neg_z.png^[transformR180",
        "sky_neg_y.png^[transformR270",
        "sky_pos_y.png^[transformR270",
        "sky_pos_x.png^[transformR270",
        "sky_neg_x.png^[transformR90"
    },
    planets = {
        {
            texture = "default_lava.png",
            position = {x=0, z=0},
            size = 1,
            automatic_rotate = 0.1
        },{
            name = "Hoth",
            position = {x=0, z=6},
            texture = "default_snow.png",
            size = 0.5,
            automatic_rotate = 1
        },{
            name = "Arrakis",
            position = {x=4, z=0},
            texture = "default_sand.png",
            size = 0.7,
            automatic_rotate = 0.3
        },{
            name = "Unnamed station",
            position = {x=2, z=6},
            texture = "scifi_nodes_grey_square.png",
            size = 0.3,
            automatic_rotate = 1
        }
    }
})