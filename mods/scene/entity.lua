
minetest.register_entity("scene:entity", {
	initial_properties = {},

	static_save = false,

	on_step = function(self)
		-- sanity checks
		if not self.data then
			self.object:remove()
			return
		end

		if not scene.is_active(self.data.session) then
			self.object:remove()
			return
		end
	end,

	on_punch = function(self, player)
		if not self.data then
			self.object:remove()
			return
		end

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
		if not self.data then
			self.object:remove()
			return
		end

		-- dispatch event
		local session_data = scene.get_session(self.data.session)
		if session_data and session_data.entities then
			local entity_session = session_data.entities[self.data.id]
			if type(entity_session.on_punch) == "function" then
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

		self.object:set_properties(self.data.properties)
	end
});
