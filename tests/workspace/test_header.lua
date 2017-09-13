---
-- make/tests/workspace/test_header.lua
-- Verify workspace header comment blocks.
--
-- Author Jason Perkins
-- Copyright (c) 2017 Jason Perkins and the Premake project
---

	local suite = test.declare("make_workspace_header")

	local p = premake

	local m = require("make")


---
-- Construct a new Query instance from an existing Context.
---

	function suite.looksOkay_onDefaultSetup()
		m.workspace.header()
		test.capture [[
# GNU Make workspace makefile autogenerated by Premake
		]]
	end
