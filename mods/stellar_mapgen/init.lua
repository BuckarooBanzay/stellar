stellar_mapgen = {}

-- sanity checks
if minetest.get_mapgen_setting("mg_name") ~= "singlenode" then
    error("this game only works with the 'singlenode' mapgen")
end

local MP = minetest.get_modpath(minetest.get_current_modname())
dofile(MP.."/mapgen.lua")

