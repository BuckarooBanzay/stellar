
local function render_mapblock(mapblock_pos)
    local minp, maxp = stellar.mapblock_to_pos(mapblock_pos)
    local pod_pos = stellar.pos_to_pod(minp)

    -- only draw one pod for testing
    if not vector.equals(pod_pos, {x=0, y=0, z=0}) then
        return
    end

    local manip = minetest.get_voxel_manip()
    local e1, e2 = manip:read_from_map(minp, maxp)
    local area = VoxelArea:new({MinEdge=e1, MaxEdge=e2})

    local data = manip:get_data()

    if stellar.is_border_mapblock(mapblock_pos, pod_pos) then
        stellar.draw_border(data, area, pod_pos, mapblock_pos, minp, maxp)
    else
        local planet_def = stellar.get_planettype("class_m")
        planet_def.draw_terrain(data, area, pod_pos, mapblock_pos, minp, maxp)
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