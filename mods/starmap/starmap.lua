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
    return starmap.new_planet(self.scene, rel_pos, def)
end

function Starmap:add_ring(rel_pos, def)
    return starmap.new_ring(self.scene, rel_pos, def)
end

function Starmap:add_text(rel_pos, def)
    return starmap.new_text(self.scene, rel_pos, def)
end

function Starmap:is_active()
    return self.scene:is_active()
end