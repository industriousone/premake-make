---
-- make/tests/workspace/test_allRule.lua
-- Verify workspace `all` target.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local suite = test.declare("make_workspace_allRule")

	local p = premake

	local m = require("make")


---
-- Construct a new Query instance from an existing Context.
---

	function suite.looksOkay_onDefaultSetup()
		m.workspace.allRule()
		test.capture [[
all: $(PROJECTS)

		]]
	end
