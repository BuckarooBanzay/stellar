
local c_stone = minetest.get_content_id("stellar_nodes:stone")
local c_water = minetest.get_content_id("stellar_nodes:water_source")

-- basic planet height noise
local height_params = {
	offset = 0,
	scale = 5,
	spread = {x=256, y=256, z=256},
	seed = 5477835,
	octaves = 2,
	persist = 0.5
}

-- perlin noise
local height_perlin

-- reuse maps
local height_perlin_map = {}

local function render_mapblock(mapblock_pos)
    local minp, maxp = stellar.mapblock_to_pos(mapblock_pos)
    local pod_pos = stellar.pos_to_pod(minp)
    local pod_minp, pod_maxp = stellar.pod_to_pos(pod_pos)
    local pod_height = pod_maxp.y - pod_minp.y

    -- only draw one pod for testing
    if not vector.equals(pod_pos, {x=0, y=0, z=0}) then
        return
    end

    local manip = minetest.get_voxel_manip()
    local e1, e2 = manip:read_from_map(minp, maxp)
    local area = VoxelArea:new({MinEdge=e1, MaxEdge=e2})

    local data = manip:get_data()

	local side_length = maxp.x - minp.x + 1
	local map_lengths_xyz = {x=side_length, y=side_length, z=side_length}

    height_perlin = height_perlin or minetest.get_perlin_map(height_params, map_lengths_xyz)
	height_perlin:get_2d_map_flat({x=minp.x, y=minp.z}, height_perlin_map)

    local perlin_index = 1

    for z=minp.z,maxp.z do
        for x=minp.x,maxp.x do
            local height_perlin_factor = math.min(1, math.abs( height_perlin_map[perlin_index] * 0.1 ) )
            local pod_min_terrain_height = pod_minp.y + (pod_height * 0.8)
            local terrain_height = pod_height * 0.2

            local pod_terrain_height_rel = height_perlin_factor * terrain_height
            local pod_terrain_height = pod_terrain_height_rel + pod_min_terrain_height
            local pod_water_height = pod_min_terrain_height + 20

            for y=minp.y,maxp.y do
                local index = area:index(x,y,z)
                if y < pod_terrain_height then
                    data[index] = c_stone
                elseif y < pod_water_height then
                    data[index] = c_water
                end
            end
            perlin_index = perlin_index + 1
        end
    end

    manip:set_data(data)
	manip:write_to_map()
end

minetest.register_on_generated(function(minp, maxp)
    local min_mapblock = stellar.pos_to_mapblock(minp)
	local max_mapblock = stellar.pos_to_mapblock(maxp)

	for z=min_mapblock.z,max_mapblock.z do
	for x=min_mapblock.x,max_mapblock.x do
	for y=min_mapblock.y,max_mapblock.y do
		local mapblock_pos = { x=x, y=y, z=z }
        render_mapblock(mapblock_pos)
    end
    end
    end
end)