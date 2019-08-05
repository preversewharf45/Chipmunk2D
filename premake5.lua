project "Chipmunk2D"
    kind "StaticLib"
    language "C"
	staticruntime "On"
    
	targetdir ("bin/" .. outputDir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputDir .. "/%{prj.name}")

	files {
		"src/**.c",
		"src/**.h",
    }
	
	removefiles {
		"src/cpPolyline.c",
		"src/cpHastySpace.c",
	}
    
	includedirs {
		"include"
	}
	
	defines {
		"_CRT_SECURE_NO_WARNINGS",
		"_LIB",
		"WIN32"
	}
	
	filter "system:windows"
        systemversion "latest"
	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines { "_DEBUG" }
	
	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		defines { "NDEBUG" }
	
	filter "configurations:Distribute"
		runtime "Release"
		optimize "on"
		defines { "NDEBUG" }
