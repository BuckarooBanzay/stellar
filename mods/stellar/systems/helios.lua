
stellar.register_system("helios", {
    name = "Helios",
    rings = {
        { radius = 4, color = "#00FF00"},
        { radius = 6 },
        { radius = 2, position = {x=0, z=6} }
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
            key = "helios_2",
            name = "Helios 2",
            position = {x=0, z=6},
            texture = "default_snow.png",
            size = 0.5,
            automatic_rotate = 0.2
        },{
            key = "helios_prime",
            name = "Helios prime",
            position = {x=4, z=0},
            texture = "default_grass.png",
            size = 0.7,
            automatic_rotate = 0.7
        },{
            name = "UV Station",
            teleporter = {x=1018, y=1, z=8},
            position = {x=2, z=6},
            texture = "scifi_nodes_grey_square.png",
            size = 0.3,
            automatic_rotate = 1
        }
    }
})