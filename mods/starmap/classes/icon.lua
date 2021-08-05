local Icon = {}
Icon.__index = Icon

local icons = {
    ["gears1"] = {x=0, y=0},
    ["gears2"] = {x=1, y=0},
    ["gears3"] = {x=2, y=0},
    ["tick1"] = {x=3, y=0},
    ["tick2"] = {x=4, y=0},
    ["tick3"] = {x=5, y=0},
}

function starmap.new_icon(scene, rel_pos, def)
    local icon = {
        scene = scene,
        glow = def.glow,
        size = def.size,
        automatic_rotate = def.automatic_rotate,
        name = def.name,
        color = def.color,
        icon_name = def.icon_name
    }
    setmetatable(icon, Icon)

    icon.entity = scene:add_entity(rel_pos, {
        on_rightclick = def.on_rightclick,
        on_punch = def.on_punch,
        properties = icon:get_properties(),
        yaw = def.yaw,
        rotation = def.rotation
    })

    return icon
end

function Icon:set_rotation(rotation)
    self.entity:set_rotation(rotation)
end

function Icon:set_yaw(yaw)
    self.entity:set_yaw(yaw)
end

function Icon:get_properties()
    local icon_index = icons[self.icon_name]
    if not icon_index then
        icon_index = {x=0, y=0}
    end
    local texture = "starmap_icons.png^[sheet:8x8:" .. icon_index.x .. "," .. icon_index.y
    if self.color then
        texture = texture .. "^[colorize:" .. self.color
    end
    local size = self.size or 1
    local glow = self.glow or 14

    return {
        visual = "upright_sprite",
        visual_size = {x=size,y=size},
        textures = {
            texture
        },
        glow = glow,
        physical = false,
        collide_with_objects = false,
        pointable = true,
        nametag = self.name
    }
end