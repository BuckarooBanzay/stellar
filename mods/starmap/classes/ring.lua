local Ring = {}
Ring.__index = Ring

function starmap.new_ring(scene, rel_pos, def)
    local ring = {
        scene = scene,
        texture = def.texture,
        glow = def.glow,
        radius = def.radius or 1,
        color = def.color or "#FFFFFF"
    }
    setmetatable(ring, Ring)

    ring.entity = scene:add_entity(rel_pos, {
        on_rightclick = def.on_rightclick,
        on_punch = def.on_punch,
        properties = ring:get_properties(),
        rotation = {x=math.pi/2, y=0, z=0},
        texture_mod = "^[colorize:" .. ring.color
    })

    return ring
end

function Ring:get_properties()
    local texture = "starmap_ring.png"
    local size = self.radius * 2 * 1.05
    local glow = self.glow or 0

    return {
        visual = "upright_sprite",
        visual_size = {x=size,y=size},
        textures = {
            texture,texture,texture,texture,texture,texture,
        },
        glow = glow,
        physical = false,
        collide_with_objects = false,
        pointable = false
    }
end