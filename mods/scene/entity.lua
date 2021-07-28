
minetest.register_entity("scene:entity", {
	initial_properties = {},

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

		return true
	end,

	on_rightclick = function(self)
		if not self.data then
			self.object:remove()
			return
		end

	end,

	get_staticdata = function(self)
		return minetest.serialize(self.data)
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
