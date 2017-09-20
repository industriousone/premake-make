---
-- make/tests/workspace/test_phonyRule.lua
-- Verify workspace `.PHONY` target.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local suite = test.declare("make_workspace_phonyRule")

	local p = premake

	local m = require("make")


---
-- Construct a new Query instance from an existing Context.
---

	function suite.looksOkay_onDefaultSetup()
		m.workspace.phonyRule()
		test.capture [[
.PHONY: all clean help $(PROJECTS) $(PROJECT_GROUPS)

		]]
	end
