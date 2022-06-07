
local Scene = {}
Scene.__index = Scene

function scene.new(origin)
    local ctx = {
        session = math.random(10000),
        origin = origin
    }
    setmetatable(ctx, Scene)
    scene.set_session(ctx.session, {
        entities = {}
    })
    return ctx
end

function Scene:add_entity(rel_pos, def)
    local epos = vector.add(self.origin, rel_pos)
    return scene.new_entity(self.session, epos, def)
end

function Scene:is_active()
    return scene.is_active(self.session)
end

function Scene:dispose()
    scene.set_session(self.session, nil)
end