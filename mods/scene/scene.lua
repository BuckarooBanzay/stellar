
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

function Scene:add_entity(def)
    local epos = vector.add(self.origin, def.pos)
    local id = math.random(10000)

    -- assemble entity session data
    local entity_session = {
        on_punch = def.on_punch,
        on_rightclick = def.on_rightclick
    }

    -- store session data
    local session_data = scene.get_session(self.session)
    if not session_data then
        -- no session active
        return false
    end
    session_data.entities[id] = entity_session

    minetest.add_entity(epos, "scene:entity", minetest.serialize({
        id = id,
        session = self.session,
        properties = def.properties
    }))

    return true
end

function Scene:is_active()
    return scene.is_active(self.session)
end

function Scene:dispose()
    scene.set_session(self.session, nil)
end