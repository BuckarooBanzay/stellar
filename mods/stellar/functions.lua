
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