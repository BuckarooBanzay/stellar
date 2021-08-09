
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

function stellar.get_current_system()
    local status = stellar.get_ship_status()
    if status then
        return systems[status.system]
    end
end

function stellar.get_current_planet()
    local status = stellar.get_ship_status()
    local system = stellar.get_current_system()
    if system and status then
        for _, planet in ipairs(system.planets) do
            if planet.key == status.planet then
                return planet
            end
        end
    end
end