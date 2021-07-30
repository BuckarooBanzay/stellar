local Starmap = {}
Starmap.__index = Starmap

function starmap.new(origin)
    local ctx = {
        origin = origin,
        scene = scene.new(origin)
    }
    setmetatable(ctx, Starmap)

    return ctx
end

function Starmap:add_planet(rel_pos, def)
    local texture = def.texture or "default_sand.png"
    local size = def.size or 1
    local automatic_rotate = def.automatic_rotate or 0
    local glow = def.glow or 0

    self.scene:add_entity(rel_pos, {
        properties = {
            visual = "cube",
            visual_size = {x=size,y=size},
            textures = {
                texture,texture,texture,texture,texture,texture,
            },
            automatic_rotate = automatic_rotate,
            glow = glow,
            physical = false,
            collide_with_objects = false,
            pointable = true,
            nametag = def.name
        }
    })
end