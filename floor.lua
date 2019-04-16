-- scaffold geniefile for floor

floor_script = path.getabsolute(path.getdirectory(_SCRIPT))
floor_root = path.join(floor_script, "floor")

floor_includedirs = {
	path.join(floor_script, "config"),
	floor_root,
}

floor_libdirs = {}
floor_links = {}
floor_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { floor_includedirs }
	end,

	_add_defines = function()
		defines { floor_defines }
	end,

	_add_libdirs = function()
		libdirs { floor_libdirs }
	end,

	_add_external_links = function()
		links { floor_links }
	end,

	_add_self_links = function()
		links { "floor" }
	end,

	_create_projects = function()

project "floor"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		floor_includedirs,
	}

	defines {}

	files {
		path.join(floor_script, "config", "**.h"),
		path.join(floor_root, "**.h"),
		path.join(floor_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
