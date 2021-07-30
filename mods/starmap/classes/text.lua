local Text = {}
Text.__index = Text

function starmap.new_text(scene, rel_pos, def)
    local text = {
        scene = scene,
        text = def.text,
        color = def.color,
        glow = def.glow
    }
    setmetatable(text, Text)

    text.entity = scene:add_entity(rel_pos, {
        on_rightclick = def.on_rightclick,
        on_punch = def.on_punch,
        properties = text:get_properties()
    })

    return text
end

function Text:get_properties()
    -- render font
    local font = font_api.get_font("metro")
    local size_x = 15
    local size_y = 1
    local lines = 1

    local textureh = font:get_height(size_y)
    local texturew = textureh * size_x / size_y

    local texture = font:render(self.text, texturew, textureh, {
        lines = lines,
        halign = "center",
        valign = "top",
        color = self.color or "#ff0000"
    })

    return {
        visual = "upright_sprite",
        visual_size = {x=size_x,y=size_y},
        textures = { texture },
        glow = tonumber(self.glow) or 0,
        physical = false,
        collide_with_objects = false,
        pointable = true
    }
end

function Text:set_text(text)
    self.text = text
end

function Text:set_color(color)
    self.color = color
end

function Text:update()
    self.entity:set_properties(self:get_properties())
end