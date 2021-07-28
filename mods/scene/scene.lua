
local Scene = {}
Scene.__index = Scene

function scene.new(origin)
    local ctx = {
        id = math.random(10000),
        origin = origin
    }
    setmetatable(ctx, Scene)
    return ctx
end

function Scene:add_entity(def)
    local epos = vector.add(self.origin, def.pos)
    minetest.add_entity(epos, "scene:entity", minetest.serialize({
        session = self.id,
        properties = def.properties
    }))
end