
-- name -> table {}
local handlers = {}

local function get_list(name)
    local list = handlers[name]
    if not list then
        list = {}
        handlers[name] = list
    end

    return list
end

stellar.events = {}

function stellar.events.on(name, fn)
    local list = get_list(name)
    table.insert(list, fn)
end

function stellar.events.off(name, fn)
    local list = get_list(name)
    local new_list = {}
    for _, existing_fn in ipairs(list) do
        if existing_fn ~= fn then
            table.insert(new_list, existing_fn)
        end
    end
    handlers[name] = list
end

function stellar.events.emit(name, data)
    local list = get_list(name)
    for _, fn in ipairs(list) do
        fn(data)
    end
end