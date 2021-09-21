
local planets = {}

function stellar_planets.get_planet(pod_pos)
    local pod_hash = minetest.get_position_from_hash(pod_pos)
    return planets[pod_hash]
end

local function generate_planet()
    local planet = {}
    -- TODO
    return planet
end

local function generate_planets()
    for x=-15,15 do
        for z=-15,15 do
            for y=-15,0 do
                local pod_pos = {x=x, y=y, z=z}
                local pod_hash = minetest.hash_node_position(pod_pos)
                local planet = generate_planet(pod_pos)
                planets[pod_hash] = planet
            end
        end
    end
end

local start = minetest.get_us_time()
generate_planets()
local diff = minetest.get_us_time() - start
print("generated " .. (30*30*15) .. " planets in " .. diff .. " us")