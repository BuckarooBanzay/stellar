local Text = {}
Text.__index = Text

function holodeck.new_text(scene, rel_pos, def)
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
        properties = text:get_properties(),
        yaw = def.yaw,
        rotation = def.rotation
    })

    return text
end

function Text:set_rotation(rotation)
    self.entity:set_rotation(rotation)
end

function Text:set_yaw(yaw)
    self.entity:set_yaw(yaw)
end

function Text:get_properties()
    -- render font
    local font = font_api.get_font("botic")
    local size_x = 10
    local size_y = 1
    local lines = 1

    for _ in self.text:gmatch("\n") do
        lines = lines + 1
    end

    local textureh = font:get_height(lines)
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
        selectionbox = {
            -1, -1, -1,
            1, 1, 1
        },
        textures = { texture },
        glow = tonumber(self.glow) or 0,
        physical = false,
        collide_with_objects = false,
        pointable = false
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