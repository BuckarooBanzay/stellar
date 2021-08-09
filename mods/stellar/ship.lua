
local status

function stellar.get_ship_status()
    -- cached
    if status then
        return status
    end

    -- read from storage
    local status_str = stellar.storage:get_string("ship")
    if status_str ~= "" then
        status = minetest.parse_json(status_str)
    end

    if not status then
        status = {
            planet = "helios_prime",
            system = "helios",
            power = 10, -- GWh
            power_max = 50
        }

        stellar.set_ship_status(status)
    end

    return status
end

function stellar.set_ship_status(new_status)
    status = new_status
    local json = minetest.write_json(status)
    stellar.storage:set_string("ship", json)
end

minetest.register_chatcommand("ship_status", {
    func = function()
        return true, minetest.write_json(stellar.get_ship_status())
    end
})