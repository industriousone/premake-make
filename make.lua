newaction {
	trigger = "make",
	shortname = "Make (experimental)",
	description = "Generate GNU makefiles for POSIX, MinGW, and Cygwin",

	onWorkspace = function(wks)
		print("Generating MAKE workspace")
	end,

	onProject = function(prj)
		print("Generating MAKE project")
	end
}
