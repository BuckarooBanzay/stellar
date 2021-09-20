

minetest.register_on_generated(function(minp)
    local pod_pos = stellar.pos_to_pod(minp)
    print("register_on_generated minp=" .. minetest.pos_to_string(minp) ..
        " pod=" .. minetest.pos_to_string(pod_pos))
end)