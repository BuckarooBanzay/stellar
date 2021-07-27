local triggers = {}

local digiline_rules = {
	-- digilines.rules.default
	{x= 1,y= 0,z= 0},{x=-1,y= 0,z= 0}, -- along x beside
	{x= 0,y= 0,z= 1},{x= 0,y= 0,z=-1}, -- along z beside
	{x= 1,y= 1,z= 0},{x=-1,y= 1,z= 0}, -- 1 node above along x diagonal
	{x= 0,y= 1,z= 1},{x= 0,y= 1,z=-1}, -- 1 node above along z diagonal
	{x= 1,y=-1,z= 0},{x=-1,y=-1,z= 0}, -- 1 node below along x diagonal
	{x= 0,y=-1,z= 1},{x= 0,y=-1,z=-1}, -- 1 node below along z diagonal
	{x= 0,y= 1,z= 0},{x= 0,y=-1,z= 0}, -- along y above and below
}

local function do_trigger(pos, channel, msg)
    local meta = minetest.get_meta(pos)
    local event = meta:get_string("event")
    if not event then
        return
    end
    local trigger = triggers[event]
    if type(trigger) ~= "function" then
        return
    end

    trigger(pos, channel, msg)
end

function lua_trigger.register_node(nodename)
    local def = minetest.registered_nodes[nodename]
    assert(def, "node not found: " .. nodename)

    local local_name = "lua_trigger:" .. nodename:gsub(":","_")

    minetest.register_node(local_name, {
        description = "Lua-trigger node for " .. nodename,
        tiles = def.tiles,
        groups = {cracky = 3},
        sounds = def.sounds,
        mesecons = {effector = {
			action_on = function(pos)
                do_trigger(pos)
			end
		}},
        digiline = {
			effector = {
				rules = digiline_rules,
				action = function(pos, _, channel, msg)
                    do_trigger(pos, channel, msg)
                end
			},
		},
        on_construct = function(pos)
            local meta = minetest.get_meta(pos)
            meta:set_string("formspec","field[event;Event;${event}")
        end,
        on_receive_fields = function(pos, _, fields, sender)
            local name = sender:get_player_name()
            if minetest.is_protected(pos,name) and not minetest.check_player_privs(name,{protection_bypass=true}) then
                minetest.record_protection_violation(pos,name)
                return
            end
            local meta = minetest.get_meta(pos)
            if fields.event then
                meta:set_string("event",fields.event)
                meta:set_string("formspec","")
            end
        end,
    })
end

function lua_trigger.register_trigger(name, fn)
    triggers[name] = fn
end