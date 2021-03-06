---
-- make/make_project.lua
-- Project makefile exporting.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local p = premake

	local make = ...
	local emit = make.emit



---
-- Set up the module
---

	local m = {}
	m.elements = {}



---
-- Project export entry point
---

	m.elements.project = function(wks)
		return {
			m.header
		}
	end

	function m.export(prj)
		p.callArray(m.elements.project, prj)
	end


	function m.header()
		emit:comment("GNU Make project makefile autogenerated by Premake")
		p.w()
	end


---
-- End of module
---

	return m
