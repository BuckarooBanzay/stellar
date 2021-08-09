
local systems = {}

function stellar.register_system(name, def)
    systems[name] = def
end

function stellar.get_system(name)
    return systems[name]
end

function stellar.get_systems()
    return systems
end