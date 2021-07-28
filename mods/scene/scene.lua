
local Scene = {}
Scene.__index = Scene

function scene.new()
    local ctx = {
        id = math.random(10000)
    }
    setmetatable(ctx, Scene)
    return ctx
end

function Scene:add_entity()
    print(self.id)
end