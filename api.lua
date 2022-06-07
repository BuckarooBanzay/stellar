
-- name -> def
local planettypes = {}

function stellar.register_planettype(name, def)
    planettypes[name] = def
end

function stellar.get_planettype(name)
    return planettypes[name]
end