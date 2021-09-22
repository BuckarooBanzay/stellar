
-- name -> def
local planettypes = {}

function stellar_mapgen.register_planettype(name, def)
    planettypes[name] = def
end

function stellar_mapgen.get_planettype(name)
    return planettypes[name]
end