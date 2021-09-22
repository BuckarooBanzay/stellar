
local c_stone = minetest.get_content_id("stellar_nodes:stone")
local c_water = minetest.get_content_id("stellar_nodes:water_source")

stellar_mapgen.register_planettype("class_m", {
    draw_terrain = function(data, area, pod_pos, _, minp, maxp)
        local pod_minp, pod_maxp = stellar.pod_to_pos(pod_pos)
        local pod_height = pod_maxp.y - pod_minp.y

        local height_perlin_map = stellar_mapgen.get_perlin_data("height", {x=minp.x, y=minp.z})
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
    end
})