---
-- make/tests/test_filename.lua
-- Verify the selection of makefile names.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local suite = test.declare("make_filename")

	local Model = require('project-model')

	local m = require("make")



---
-- If there are no location conflicts, should use 'Makefile' for workspaces.
---

	function suite.workspace_usesMakefileOnNoConflicts()
		workspace('Workspace1')

		project('Project1')
		location('Project1')

		local wks = Model.workspace('Workspace1')
		local filename = m.filename(wks)
		test.isequal(path.join(os.getcwd(), 'Makefile'), filename)
	end



---
-- If a workspace and a project share the same location, the workspace
-- should use 'Makefile'.
---

	function suite.workspace_usesMakefileOnProjectConflict()
		workspace('Workspace1')
		project('Project1')

		local wks = Model.workspace('Workspace1')
		local filename = m.filename(wks)
		test.isequal(path.join(os.getcwd(), 'Makefile'), filename)
	end



---
-- If two workspaces share the same location, the workspace should use
-- its differentiated name.
---

	function suite.workspace_usesOwnNameOnWorkspaceConflict()
		workspace('Workspace1')
		workspace('Workspace2')

		local wks = Model.workspace('Workspace1')
		local filename = m.filename(wks)
		test.isequal(path.join(os.getcwd(), 'Workspace1.make'), filename)
	end



---
-- If there are no location conflicts, should use 'Makefile' for projects.
---

	function suite.project_usesMakefileOnNoConflicts()
		workspace('Workspace1')

		project('Project1')
		location('Project1')

		local prj = Model.workspace('Workspace1'):project('Project1')
		local filename = m.filename(prj)
		test.isequal(path.join(os.getcwd(), 'Project1/Makefile'), filename)
	end



---
-- If a workspace and a project share the same location, the project should
-- use its differentiated name.
---

	function suite.project_usesOwnNameOnWorkspaceConflict()
		workspace('Workspace1')
		project('Project1')

		local prj = Model.workspace('Workspace1'):project('Project1')
		local filename = m.filename(prj)
		test.isequal(path.join(os.getcwd(), 'Project1.make'), filename)
	end



---
-- If two workspaces share the same location, the workspace should use
-- its differentiated name.
---

	function suite.workspace_usesOwnNameOnWorkspaceConflict()
		workspace('Workspace1')
		location('..')
		project('Project1')
		project('Project2')

		local prj = Model.workspace('Workspace1'):project('Project1')
		local filename = m.filename(prj)
		test.isequal(path.join(os.getcwd(), 'Project1.make'), filename)
	end
