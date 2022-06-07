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
        properties = def.properties,
        rotation = def.rotation,
        yaw = def.yaw,
        texture_mod = def.texture_mod
    }

    -- store session data
    local session_data = scene.get_session(session)
    if not session_data then
        -- no session active
        return false
    end
    session_data.entities[ctx.id] = entity_session

    minetest.add_entity(pos, "stellar:scene_entity", minetest.serialize({
        id = ctx.id,
        session = session
    }))

    return ctx
end

function Entity:set_properties(properties)
    self:set_attribute("properties", properties)
end

function Entity:set_rotation(rotation)
    self:set_attribute("rotation", rotation)
end

function Entity:set_yaw(yaw)
    self:set_attribute("yaw", yaw)
end

function Entity:set_texture_mod(mod)
    self:set_attribute("texture_mod", mod)
end

function Entity:set_attribute(key, value)
    local session_data = scene.get_session(self.session)
    if not session_data then
        return false
    end
    local entity_session = session_data.entities[self.id]
    if entity_session then
        entity_session[key] = value
    end
end

function Entity:is_active()
    local session_data = scene.get_session(self.session)
    return session_data.entities[self.id] ~= nil
end

function Entity:dispose()
    local session_data = scene.get_session(self.session)
    if not session_data then
        return false
    end
    session_data.entities[self.id] = nil
end