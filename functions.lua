
--- returns the pos position from the node position
-- @param pos the node position
-- @return the pod position
function stellar.pos_to_pod(pos)
	return vector.floor( vector.divide(pos, 2000) )
end

--- returns the node ppositions from the pod position
-- @param pod_pos the pod-position
-- @return the min-node-position
-- @return the max-node-position
function stellar.pod_to_pos(pod_pos)
    local min = vector.multiply(pod_pos, 2000)
	local max = vector.add(min, 1999)
	return min, max
end

--- returns the mapblock position for the node-position
-- @param pos the node-position
-- @return the mapblock-position
function stellar.pos_to_mapblock(pos)
	return vector.floor( vector.divide(pos, 16))
end

--- returns the max/min bounds for the mapblock-position
-- @param block_pos the mapblock-position
-- @return the min-node-position
-- @return the max-node-position
function stellar.mapblock_to_pos(block_pos)
	local min = vector.multiply(block_pos, 16)
	local max = vector.add(min, 15)
	return min, max
end

--- returns the max/min bounds for the node-position
-- @param pos the node-position
-- @return the min-node-position
-- @return the max-node-position
function stellar.get_mapblock_bounds_from_pos(pos)
	local mapblock = vector.floor( vector.divide(pos, 16))
	return stellar.mapblock_to_pos(mapblock)
end