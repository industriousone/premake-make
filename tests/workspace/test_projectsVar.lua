---
-- make/tests/workspace/test_projectsVar.lua
-- Verify workspace `$PROJECTS` variable.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local suite = test.declare("make_workspace_projectsVar")

	local p = premake

	local m = require("make")


---
-- Construct a new Query instance from an existing Context.
---

	function suite.looksOkay_onDefaultSetup()
		m.workspace.projectsVar()
		test.capture [[
PROJECTS :=
		]]
	end
