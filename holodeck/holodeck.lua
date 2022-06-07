local Holodeck = {}
Holodeck.__index = Holodeck

function holodeck.new(origin)
    local ctx = {
        origin = origin,
        scene = scene.new(origin)
    }
    setmetatable(ctx, Holodeck)

    return ctx
end

function Holodeck:add_planet(rel_pos, def)
    return holodeck.new_planet(self.scene, rel_pos, def)
end

function Holodeck:add_ring(rel_pos, def)
    return holodeck.new_ring(self.scene, rel_pos, def)
end

function Holodeck:add_text(rel_pos, def)
    return holodeck.new_text(self.scene, rel_pos, def)
end

function Holodeck:add_icon(rel_pos, def)
    return holodeck.new_icon(self.scene, rel_pos, def)
end

function Holodeck:is_active()
    return self.scene:is_active()
end