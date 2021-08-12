
stellar.register_system("helios", {
    name = "Helios",
    rings = {
        { radius = 2 },
        { radius = 4, color = "#00FF00"},
        { radius = 6 },
        { radius = 2, position = {x=0, z=6} }
    },
    skybox = "space",
    planets = {
        {
            texture = "default_lava.png",
            position = {x=0, z=0},
            size = 1,
            automatic_rotate = 0.1
        },{
            key = "helios_3",
            name = "Helios 3",
            teleporter = {x=1006, y=985, z=15},
            position = {x=1.414, z=-1.414},
            texture = "default_stone.png",
            size = 0.5,
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
            key = "uv_station",
            name = "UV Station",
            teleporter = {x=1018, y=1, z=8},
            position = {x=2, z=6},
            texture = "scifi_nodes_grey_square.png",
            size = 0.3,
            automatic_rotate = 1
        }
    }
})