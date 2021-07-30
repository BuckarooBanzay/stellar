
minetest.register_entity("scene:entity", {
	initial_properties = {},

	static_save = false,

	on_step = function(self)
		local session_data = scene.get_session(self.data.session)
		if not session_data then
			-- session expired or disposed
			self.object:remove()
			return
		end
		if session_data and session_data.entities then
			local entity_session = session_data.entities[self.data.id]
			if entity_session.properties then
				-- change properties to new values
				self.object:set_properties(entity_session.properties)
				-- clear/sign-off data
				entity_session.properties = nil
			end

			if entity_session.rotation then
				self.object:set_rotation(entity_session.rotation)
				entity_session.rotation = nil
			end

			if entity_session.yaw then
				self.object:set_yaw(entity_session.yaw)
				entity_session.yaw = nil
			end
		end
	end,

	on_punch = function(self, player)
		-- dispatch event
		local session_data = scene.get_session(self.data.session)
		if session_data and session_data.entities then
			local entity_session = session_data.entities[self.data.id]
			if type(entity_session.on_punch) == "function" then
				entity_session.on_punch(player)
			end
		end

		return true
	end,

	on_rightclick = function(self, player)
		-- dispatch event
		local session_data = scene.get_session(self.data.session)
		if session_data and session_data.entities then
			local entity_session = session_data.entities[self.data.id]
			if type(entity_session.on_rightclick) == "function" then
				entity_session.on_rightclick(player)
			end
		end
	end,

	on_deactivate = function(self)
		-- close session if one of the entities is unloaded
		scene.set_session(self.data.session, nil)
	end,

	on_activate = function(self, staticdata)
		self.data = minetest.deserialize(staticdata)

		if not self.data then
			self.object:remove()
			return
		end
	end
});
