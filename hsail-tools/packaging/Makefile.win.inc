WIN_DISABLE_WARNINGS = -wd4819 -wd4146 -wd4503 -wd4996 -wd4800 -wd4244 -wd4624 -wd4355 \
                   -wd4715 -wd4180 -wd4345 -wd4224 -wd4351 -wd4267 -wd4065 -wd4146 \
                   -wd4800 -wd4996 -wd4244 -wd4503 -wd4715

WIN_CC_DEFINES = /D"WIN_OS" /D"NOCRYPT" /D"TARGET_TYPE_EXE" /DqLittleEndian \
/D _CRT_NONSTDC_NO_DEPRECATE /D ATI_OS_WIN /D ATI_OS_VISTA /D ATI_OS_WIN /D ATI_OS_LH /D ATI_OS_W7 \
/D ATI_ARCH_X86 /D ATI_BITS_32 /D ATI_ENDIAN_LITTLE /D LITTLEENDIAN -D LITTLEENDIAN_CPU \
/D _SCL_SECURE_NO_WARNINGS /D _SCL_SECURE_NO_DEPRECATE  

ifeq ("$(ARCH)","x64")
ARCH_CFLAGS =  -D__x86_64__ -D__AMD64__ -D ATI_BITS_64 
else
ARCH_CFLAGS =  /arch:SSE2 -D__i386__ -D ATI_BITS_32 
endif

ifeq ("$(FLAVOUR)","DEBUG")
FLAVOUR_FLAGS= /D"_DEBUG"     /Z7 /Od /MTd  
else
FLAVOUR_FLAGS= /D"_NDEBUG"    /O2 /MT
endif


WIN_COMMON_CFLAGS =   /c /Oy- /nologo /W3  /Z7 /WX /EHsc $(DISABLE_WARNINGS) $(CC_DEFINES)


CFLAGS = $(WIN_COMMON_CFLAGS) $(FLAVOUR_FLAGS) $(ARCH_CFLAGS)  $(WIN_CC_DEFINES) $(WIN_DISABLE_WARNINGS)

WIN_DISABLE_LD_WARNINGS = /ignore:4098
WIN_SYSTEM_LIBS = kernel32.lib shell32.lib advapi32.lib
# /NODEFAULTLIB:libcd 
WIN_LDFLAGS = /nologo /debug $(WIN_PREBUILD_LIBS) $(WIN_SYSTEM_LIBS) $(WIN_DISABLE_LD_WARNINGS)
WIN_LIBFLAGS = /nologo
# /nologo /debug $(WIN_PREBUILD_LIBS) $(WIN_SYSTEM_LIBS) $(WIN_DISABLE_LD_WARNINGS)

WIN_CC = cl.exe
WIN_LIB = lib.exe
WIN_LINK = link.exe