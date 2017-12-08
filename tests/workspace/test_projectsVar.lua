---
-- make/tests/workspace/test_projectsVar.lua
-- Verify workspace `$PROJECTS` variable.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local suite = test.declare('make_workspace_projectsVar')

	local Model = require('project-model')

	local m = require('make')


---
-- Setup
---

	function suite.setup()
		workspace('MyWorkspace')
	end

	local function prepare()
		local wks = Model.workspace('MyWorkspace')
		m.workspace.projectsVar(wks)
	end



	function suite.emitsEmptyValue_onNoProjects()
		prepare()

		test.capture [[
PROJECTS +=
		]]
	end



	function suite.emitsSingleName_onSingleProject()
		project('Project1')
		project('Project2')

		prepare()

		test.capture [[
PROJECTS += Project1 Project2
		]]
	end
