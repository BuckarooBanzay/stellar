local c_border = minetest.get_content_id("stellar_nodes:border")

function stellar_mapgen.is_border_mapblock(mapblock_pos, pod_pos)
    local minp, maxp = stellar.pod_to_pos(pod_pos)
    local min_mapblock = stellar.pos_to_mapblock(vector.add(minp, 16*10))
    local max_mapblock = stellar.pos_to_mapblock(vector.subtract(maxp, 16*10))

    return mapblock_pos.x < min_mapblock.x or
        mapblock_pos.x > max_mapblock.x or
        mapblock_pos.y < min_mapblock.y or
        mapblock_pos.y > max_mapblock.y or
        mapblock_pos.z < min_mapblock.z or
        mapblock_pos.z > max_mapblock.z
end

function stellar_mapgen.draw_border(data, area, _, _, minp, maxp)
    for z=minp.z,maxp.z do
    for x=minp.x,maxp.x do
    for y=minp.y,maxp.y do
        local index = area:index(x,y,z)
        data[index] = c_border
    end
    end
    end
end