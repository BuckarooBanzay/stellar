
-- name -> perlin
local perlin_cache = {}

-- name -> params
local perlin_params = {}

-- name -> map data
local cache = {}

function stellar.register_perlin(name, params)
    perlin_params[name] = params
end

function stellar.get_perlin_data(name, area)
    local perlin = perlin_cache[name]
    if not perlin then
        -- initialize perlin data
        local map_lengths_xyz = {x=16, y=16, z=16}
        perlin = minetest.get_perlin_map(perlin_params[name], map_lengths_xyz)
        perlin_cache[name] = perlin
        cache[name] = {}
    end

    local map = cache[name]
    perlin:get_2d_map_flat(area, map)
    return map
end

stellar.register_perlin("height", {
    offset = 0,
    scale = 5,
    spread = {x=256, y=256, z=256},
    seed = 5477835,
    octaves = 2,
    persist = 0.5
})