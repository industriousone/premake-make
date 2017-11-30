---
-- make/tests/workspace/test_projectsRule.lua
-- Verify workspace project build rules.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local suite = test.declare('make_workspace_projectRule')

	local Model = require('project-model')

	local m = require('make')



---
-- Setup
---

	function suite.setup()
		test.createWorkspace()
	end

	local function prepare()
		local prj = Model.workspace('MyWorkspace'):project('MyProject')
		m.workspace.projectRule(prj)
	end



---
-- Verify a simple project with no dependencies.
---

	function suite.projectRule_onNoDependencies()
		prepare()

		test.capture [[
MyProject:
	@echo "==== Building MyProject ===="
	@${MAKE} --no-print-directory -C . -f MyProject.make

		]]
	end
