local libvorbis_files = 
{
	"lib/mdct.c", "lib/smallft.c", "lib/block.c", "lib/envelope.c", "lib/window.c", "lib/lsp.c",
	"lib/lpc.c", "lib/analysis.c", "lib/synthesis.c", "lib/psy.c", "lib/info.c",
	"lib/floor1.c", "lib/floor0.c",
	"lib/res0.c", "lib/mapping0.c", "lib/registry.c", "lib/codebook.c", "lib/sharedbook.c",
	"lib/lookup.c", "lib/bitrate.c"
	--[[,"envelope.h", "lpc.h lsp.h", "codebook.h", "misc.h", "psy.h",
	"masking.h", "os.h", "mdct.h", "smallft.h", "highlevel.h",
	"registry.h", "scales.h", "window.h", "lookup.h", "lookup_data.h",
	"codec_internal.h", "backends.h", "bitrate.h"]]
}

local libvorbisenc_files = 
{ 
	"lib/vorbisenc.c"
}

local libvorbisfile_files = 
{
	"lib/vorbisfile.c"
}

project "libvorbis"
	version = "1.3.3"

	language "C"
	
	files { libvorbis_files }
	includedirs { "include/", "lib/", "../libogg/include" }
	
	links { "libogg" }
	
	kind ( LIB_LIBVORBIS.KIND )
	
	targetname( LIB_LIBVORBIS.KIND == "StaticLib" and "libvorbis_static" or "libvorbis" )
	
	configuration {"SharedLib", "windows"}
		linkoptions { "/DEF:\"../../Source/Thirdparty/libvorbis/win32/vorbis.def\"" }
	configuration {}
	
	targetdir( LDIR_THIRDPARTY_LIB )
	location( LDIR_THIRDPARTY_BUILD )

	suffix_macro ( version, true )
	
project "libvorbisenc"
	version = "1.3.3"

	language "C"
	
	files { libvorbisenc_files }
	includedirs { "include/", "lib/", "../libogg/include" }
	
	links { "libogg", "libvorbis" }
		
	kind ( LIB_LIBVORBIS.KIND )
	
	targetname( LIB_LIBVORBIS.KIND == "StaticLib" and "libvorbisenc_static" or "libvorbisenc" )
	
	configuration {"SharedLib", "windows"}
		linkoptions { "/DEF:\"../../Source/Thirdparty/libvorbis/win32/vorbisenc.def\"" }
	configuration {}
	
	targetdir( LDIR_THIRDPARTY_LIB )
	location( LDIR_THIRDPARTY_BUILD )

	suffix_macro ( version, true )
	
project "libvorbisfile"
	version = "1.3.3"

	language "C"
	
	files { libvorbisfile_files }
	includedirs { "include/", "lib/", "../libogg/include" }
	
	links { "libogg", "libvorbis" }
		
	kind ( LIB_LIBVORBIS.KIND )
	
	targetname( LIB_LIBVORBIS.KIND == "StaticLib" and "libvorbisfile_static" or "libvorbisfile" )
	
	configuration {"SharedLib", "windows"}
		linkoptions { "/DEF:\"../../Source/Thirdparty/libvorbis/win32/vorbisfile.def\"" }
	configuration {}
	
	targetdir( LDIR_THIRDPARTY_LIB )
	location( LDIR_THIRDPARTY_BUILD )

	suffix_macro ( version, true )