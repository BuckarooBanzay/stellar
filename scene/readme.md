
## Entity scene management

IoC but for minetest entities

```lua
-- create scene
local origin = {x=0, y=0, z=0}
scene = scene.new(origin)

-- check if scene is still usable/active
if scene:is_active() then
    print("ok")
end

-- add entities
local texture = "default_sand.png"
local e = scene:add_entity({x=2, y=0, z=0}, {
    on_rightclick = function(player) end,
    on_punch = function(player) end,
    properties = {
        visual = "cube",
        visual_size = {x=1,y=1},
        textures = {
            texture,texture,texture,texture,texture,texture,
        },
        automatic_rotate = 1,
        glow = 0,
        physical = false,
        collide_with_objects = false,
        pointable = true,
        nametag = "myname"
    }
})

-- check if entity is still usable/active
if e:is_active() then
    print("ok")
end

-- change entity
texture = "default_stone.png"
e:set_properties({
    visual = "cube",
    visual_size = {x=2,y=2},
    textures = {
        texture,texture,texture,texture,texture,texture,
    },
    automatic_rotate = 2,
    glow = 0,
    physical = false,
    collide_with_objects = false,
    pointable = true,
    nametag = "myname-xyz"
})

-- dispose single entity
e:dispose()

-- dispose whole scene
scene:dispose()
```