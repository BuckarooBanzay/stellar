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
        on_rightclick = def.on_rightclick,
        on_punch = def.on_punch,
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

function Starmap:add_text(rel_pos, def)
    -- render font
    local font = font_api.get_font("metro")
    local size_x = 15
    local size_y = 1
    local lines = 1

    local textureh = font:get_height(size_y)
    local texturew = textureh * size_x / size_y

    local texture = font:render(def.text, texturew, textureh, {
        lines = lines,
        halign = "center",
        valign = "top",
        color = def.color or "#ff0000"
    })

    self.scene:add_entity(rel_pos, {
        on_rightclick = def.on_rightclick,
        on_punch = def.on_punch,
        properties = {
            visual = "upright_sprite",
            visual_size = {x=size_x,y=size_y},
            textures = { texture },
            glow = tonumber(def.glow) or 0,
            physical = false,
            collide_with_objects = false,
            pointable = true
        }
    })
end