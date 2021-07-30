local Entity = {}
Entity.__index = Entity

function scene.new_entity(session, pos, def)
    local ctx = {
        session = session,
        id = math.random(10000)
    }
    setmetatable(ctx, Entity)

    -- assemble entity session data
    local entity_session = {
        on_punch = def.on_punch,
        on_rightclick = def.on_rightclick,
        properties = def.properties
    }

    -- store session data
    local session_data = scene.get_session(session)
    if not session_data then
        -- no session active
        return false
    end
    session_data.entities[ctx.id] = entity_session

    minetest.add_entity(pos, "scene:entity", minetest.serialize({
        id = ctx.id,
        session = session
    }))

    return ctx
end

function Entity:set_properties(properties)
    local session_data = scene.get_session(self.session)
    if not session_data then
        return false
    end
    if session_data and session_data.entities then
        local entity_session = session_data.entities[self.data.id]
        if entity_session then
            entity_session.properties = properties
        end
    end
end

-- TODO: Entity:dispose()