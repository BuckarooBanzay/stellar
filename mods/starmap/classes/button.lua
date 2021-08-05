local Button = {}
Button.__index = Button

function starmap.new_button(scene, rel_pos, def)
    local button = {
        scene = scene,
        texture = def.texture,
        glow = def.glow,
        size = def.size,
        automatic_rotate = def.automatic_rotate,
        name = def.name
    }
    setmetatable(button, Button)

    button.entity = scene:add_entity(rel_pos, {
        on_rightclick = def.on_rightclick,
        on_punch = def.on_punch,
        properties = button:get_properties()
    })

    return button
end

function Button:get_properties()
    local texture = self.texture or "scifi_nodes_octrng.png"
    local size = self.size or 1
    local glow = self.glow or 0

    return {
        visual = "cube",
        visual_size = {x=size,y=size},
        textures = {
            texture,texture,texture,texture,texture,texture,
        },
        glow = glow,
        physical = false,
        collide_with_objects = false,
        pointable = true,
        nametag = self.name
    }
end