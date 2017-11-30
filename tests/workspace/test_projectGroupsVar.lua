---
-- make/tests/workspace/test_projectsGroupsVar.lua
-- Verify workspace `$PROJECT_GROUPS` variable.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local suite = test.declare("make_workspace_projectGroupsVar")

	local p = premake

	local m = require("make")



	function suite.emitsEmptyValue_onNoGroups()
		m.workspace.projectGroupsVar()
		test.capture [[
PROJECT_GROUPS :=
		]]
	end
