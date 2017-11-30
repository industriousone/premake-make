---
-- make/make.lua
-- Make exporter module entry point.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local Model = require('project-model')


---
-- Set up the module components.
---

	local m = dofile("./make_common.lua")

	m.workspace = assert(loadfile("make_workspace.lua"))(m)
	m.project = assert(loadfile("make_project.lua"))(m)



---
-- Export a project.
---

	function m.onProject(prj)
		prj = Model.workspace(prj.workspace.name):project(prj.name)
		local filename = m.filename(prj)
		prj:export(filename, m.project.export)
	end



---
-- Export a workspace.
---

	function m.onWorkspace(wks)
		wks = Model.workspace(wks.name)
		local filename = m.filename(wks)
		wks:export(filename, m.workspace.export)
	end




---
-- Register the "make" action.
---

	newaction {
		trigger = "make",
		shortname = "Make (experimental)",
		description = "Experimental next-generation makefile generator",
		onWorkspace = m.onWorkspace,
		onProject = m.onProject
	}



---
-- End of module
---

	return m
