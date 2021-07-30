
minetest.register_chatcommand("scene", {
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if not player then
            return
        end
        local ppos = player:get_pos()
        local s = scene.new(ppos)
        s:add_entity({
            pos = { x=0, y=2, z=0 },
            on_punch = function(p)
                print("punch: " .. p:get_player_name())
                s:dispose()
            end,
            on_rightclick = function(p)
                print("rightclick: " .. p:get_player_name())
            end,
            properties = {
                visual = "cube",
                visual_size = {x=1,y=1},
                textures = {
                    "default_sand.png",
                    "default_sand.png",
                    "default_sand.png",
                    "default_sand.png",
                    "default_sand.png",
                    "default_sand.png"
                },
                automatic_rotate = 1,
                glow = 10,
                physical = false,
                collide_with_objects = false,
                pointable = true,
                nametag = "test"
            }
        })
    end
})