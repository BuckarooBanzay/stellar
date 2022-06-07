local Planet = {}
Planet.__index = Planet

function holodeck.new_planet(scene, rel_pos, def)
    local planet = {
        scene = scene,
        texture = def.texture,
        glow = def.glow,
        size = def.size,
        automatic_rotate = def.automatic_rotate,
        name = def.name
    }
    setmetatable(planet, Planet)

    planet.entity = scene:add_entity(rel_pos, {
        on_rightclick = def.on_rightclick,
        on_punch = def.on_punch,
        properties = planet:get_properties()
    })

    return planet
end

function Planet:get_properties()
    local texture = self.texture or "default_sand.png"
    local size = self.size or 1
    local automatic_rotate = self.automatic_rotate or 0
    local glow = self.glow or 0

    return {
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
        nametag = self.name
    }
end