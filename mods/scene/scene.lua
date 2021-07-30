
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
        on_rightclick = def.on_rightclick,
        properties = def.properties
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
        session = self.session
    }))

    return true
end

function Scene:add_text(def)
        -- render font
    local font = font_api.get_font("metro")
    local size_x = 15
    local size_y = 1
    local lines = 1

    local textureh = font:get_height(size_y)
    local texturew = textureh * size_x / size_y

    print(textureh, texturew)

    local texture = font:render(def.text, texturew, textureh, {
        lines = lines,
        halign = "center",
        valign = "top",
        color = def.color or "#ff0000"
    })

    def.properties = {
        visual = "upright_sprite",
        visual_size = {x=size_x,y=size_y},
        textures = { texture },
        glow = tonumber(def.glow) or 0,
        physical = false,
        collide_with_objects = false,
        pointable = true
    }

    return self:add_entity(def)
end

function Scene:is_active()
    return scene.is_active(self.session)
end

function Scene:dispose()
    scene.set_session(self.session, nil)
end