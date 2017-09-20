---
-- make/make_workspace.lua
-- Workspace makefile exporting.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local m = {}

	local p = premake

	m.elements = {}


---
-- Workspace export entry point.
---

	m.elements.workspace = function(wks)
		return {
			m.header
		}
	end

	function m.export(wks)
		p.callArray(m.elements.workspace, wks)
	end


	function m.header()
		p.w("# GNU Make workspace makefile autogenerated by Premake")
	end


---
-- End of module
---

	return m