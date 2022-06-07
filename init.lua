stellar = {}

local MP = minetest.get_modpath(minetest.get_current_modname())
dofile(MP.."/api.lua")
dofile(MP.."/functions.lua")
dofile(MP.."/names.lua")
dofile(MP.."/perlin.lua")
dofile(MP.."/mapgen.lua")
dofile(MP.."/border_node.lua")
dofile(MP.."/border_mapgen.lua")
dofile(MP.."/planettypes/classm.lua")

-- TODO: namespace embedded mods properly

-- scene
scene = {}
dofile(MP.."/scene/classes/scene.lua")
dofile(MP.."/scene/classes/entity.lua")
dofile(MP.."/scene/session.lua")
dofile(MP.."/scene/entity.lua")

-- holodeck
holodeck = {}
dofile(MP.."/holodeck/classes/planet.lua")
dofile(MP.."/holodeck/classes/text.lua")
dofile(MP.."/holodeck/classes/ring.lua")
dofile(MP.."/holodeck/classes/icon.lua")
dofile(MP.."/holodeck/holodeck.lua")
