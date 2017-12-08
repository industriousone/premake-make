---
-- make/tests/project/test_defines.lua
-- Verify project and file level handling of defines (/D.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local suite = test.declare('make_project_defines')

	local Model = require('project-model')
	local m = require('make')

	local gcc = premake.tools.gcc


---
-- Setup
---

	local prj

	function suite.setup()
		test.createWorkspace()
	end

	local function prepare()
		prj = Model.workspace('MyWorkspace'):project('MyProject')
	end


---
-- Defines should be decorated for the toolset.
---

	function suite.project_includesProjectLevelDefines()
		defines { 'SYMBOL1', 'SYMBOL2' }

		prepare()
		m.project.defines(prj, gcc)

		test.capture [[
DEFINES += -DSYMBOL1 -DSYMBOL2
		]]
	end
