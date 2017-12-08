---
-- make/make_common.lua
-- Make exporter common code, shared between workspace, project, etc. generation.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local p = premake
	local Model = require('project-model')


---
-- Set up the module.
---

	local m = {}


---
-- Hardcode a simple GNU Make emitter for now. Trying to see if we can use a single
-- `make` action that can target GNU make, nmake, etc. with an underlying 'emitter'
-- translating any syntax differences.
---

	local gmake = {}


	setmetatable(gmake, {
		__index = function(self, key)
			local value = m[key]
			return value
		end
	})


	function gmake.assignment(self, variable, value)
		local operator

		if type(value) == 'table' then
			value = table.concat(value, ' ')
			operator = '+='
		else
			operator = ':='
		end

		if value and #value > 0 then
			p.w('%s %s %s', variable, operator, value)
		else
			p.w('%s %s', variable, operator)
		end
	end


	function gmake.comment(self, value)
		p.w('# %s', value)
	end


	m.emit = gmake



---
-- Get the makefile file name for a workspace or a project. If this object is the
-- only one writing to a location then I can use 'Makefile'. If more than one object
-- writes to the same location I use name + '.make' to keep it unique.
--
-- @param object
--    The target workspace or project object.
---

	function m.filename(object)
		local count = 0

		for wks in Model.eachWorkspace() do
			if wks.location == object.location then
				count = count + 1
			end

			-- If object is a project, check for conflicts against other projects
			if object.workspace ~= nil then
				for prj in wks:eachProject() do
					if prj.location == object.location then
						count = count + 1
					end
				end
			end
		end

		local filename = iif(count == 1, 'Makefile', object.filename .. '.make')
		return path.join(object.location, filename)
	end



---
-- End of module
---

	return m
