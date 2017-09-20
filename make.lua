---
-- make/make.lua
-- Make exporter module entry point.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local m = {}

	local Workspace = require("workspace")
	local Query = require("query")

	local p = premake

	m.workspace = dofile("make_workspace.lua")
	m.project = dofile("make_project.lua")


---
-- Register the "make" action.
---

	newaction {
		trigger = "make",
		shortname = "Make (experimental)",
		description = "Experimental next-generation makefile generator",

		onWorkspace = function(wks)
			wks = Workspace.new(wks)
			p.generate(wks, ".make", m.workspace.export)
		end,

		onProject = function(prj)
			prj = Query.new(prj)
			p.generate(prj, ".make", m.project.export)
		end
	}


---
-- End of module
---

	return m
