
minetest.register_entity("scene:entity", {
	initial_properties = {},

	static_save = false,

	on_step = function(self, dtime)
		-- sanity checks
		if not self.data then
			self.object:remove()
			return
		end

		if not self.dtime then
			-- set dtime
			self.dtime = dtime
		else
			-- increment
			self.dtime = self.dtime + dtime
		end

		if self.dtime < 2 then
			-- skip check
			return
		end

		if not scene.is_active(self.data.session) then
			self.object:remove()
			return
		end
	end,

	on_punch = function(self)
		if not self.data then
			self.object:remove()
			return
		end

		-- TODO: event
		return true
	end,

	on_rightclick = function(self)
		if not self.data then
			self.object:remove()
			return
		end

		-- TODO: event
	end,

	get_staticdata = function(self)
		print("scene:entity -> get_staticdata")
		return minetest.serialize(self.data)
	end,

	on_deactivate = function()
		print("scene:entity -> on_deactivate")
	end,

	on_activate = function(self, staticdata)
		print("scene:entity -> on_activate")
		self.data = minetest.deserialize(staticdata)

		if not self.data then
			self.object:remove()
			return
		end

		self.object:set_properties(self.data.properties)

	end
});
