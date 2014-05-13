# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sraghave/drivers/opencl/compiler/llvm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sraghave/drivers/opencl/compiler/llvm/build

# Include any dependencies generated for this target.
include tools/llvm-config/CMakeFiles/llvm-config.dir/depend.make

# Include the progress variables for this target.
include tools/llvm-config/CMakeFiles/llvm-config.dir/progress.make

# Include the compile flags for this target's objects.
include tools/llvm-config/CMakeFiles/llvm-config.dir/flags.make

tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o: tools/llvm-config/CMakeFiles/llvm-config.dir/flags.make
tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o: ../tools/llvm-config/llvm-config.cpp
tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o: tools/llvm-config/BuildVariables.inc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sraghave/drivers/opencl/compiler/llvm/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/llvm-config.dir/llvm-config.cpp.o -c /home/sraghave/drivers/opencl/compiler/llvm/tools/llvm-config/llvm-config.cpp

tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm-config.dir/llvm-config.cpp.i"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/sraghave/drivers/opencl/compiler/llvm/tools/llvm-config/llvm-config.cpp > CMakeFiles/llvm-config.dir/llvm-config.cpp.i

tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm-config.dir/llvm-config.cpp.s"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/sraghave/drivers/opencl/compiler/llvm/tools/llvm-config/llvm-config.cpp -o CMakeFiles/llvm-config.dir/llvm-config.cpp.s

tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o.requires:
.PHONY : tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o.requires

tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o.provides: tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o.requires
	$(MAKE) -f tools/llvm-config/CMakeFiles/llvm-config.dir/build.make tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o.provides.build
.PHONY : tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o.provides

tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o.provides.build: tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o

tools/llvm-config/BuildVariables.inc:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sraghave/drivers/opencl/compiler/llvm/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building BuildVariables.inc include."
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && echo s!@LLVM_SRC_ROOT@!/home/sraghave/drivers/opencl/compiler/llvm! > /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && echo s!@LLVM_OBJ_ROOT@!/home/sraghave/drivers/opencl/compiler/llvm/build! >> /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && echo "s!@LLVM_CPPFLAGS@!   -D_GNU_SOURCE -Wall -W -Wno-unused-parameter -Wwrite-strings -pedantic -Wno-long-long -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS!" >> /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && echo "s!@LLVM_CFLAGS@! -fPIC   -D_GNU_SOURCE -Wall -W -Wno-unused-parameter -Wwrite-strings -pedantic -Wno-long-long -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS!" >> /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && echo "s!@LLVM_CXXFLAGS@! -fPIC -fvisibility-inlines-hidden   -D_GNU_SOURCE -Wall -W -Wno-unused-parameter -Wwrite-strings -pedantic -Wno-long-long -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS!" >> /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && echo "s!@LLVM_LDFLAGS@! !" >> /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && echo s!@LLVM_BUILDMODE@!! >> /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && echo s!@LLVM_SYSTEM_LIBS@!-ldl -lpthread! >> /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && echo s!@LLVM_TARGETS_BUILT@!AMDIL HSAIL X86! >> /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && sed -f /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.configure.sed < /home/sraghave/drivers/opencl/compiler/llvm/tools/llvm-config/BuildVariables.inc.in > /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/BuildVariables.inc

# Object files for target llvm-config
llvm__config_OBJECTS = \
"CMakeFiles/llvm-config.dir/llvm-config.cpp.o"

# External object files for target llvm-config
llvm__config_EXTERNAL_OBJECTS =

bin/llvm-config: tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o
bin/llvm-config: lib/libLLVMSupport.a
bin/llvm-config: tools/llvm-config/CMakeFiles/llvm-config.dir/build.make
bin/llvm-config: tools/llvm-config/CMakeFiles/llvm-config.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/llvm-config"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm-config.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/llvm-config/CMakeFiles/llvm-config.dir/build: bin/llvm-config
.PHONY : tools/llvm-config/CMakeFiles/llvm-config.dir/build

# Object files for target llvm-config
llvm__config_OBJECTS = \
"CMakeFiles/llvm-config.dir/llvm-config.cpp.o"

# External object files for target llvm-config
llvm__config_EXTERNAL_OBJECTS =

tools/llvm-config/CMakeFiles/CMakeRelink.dir/llvm-config: tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o
tools/llvm-config/CMakeFiles/CMakeRelink.dir/llvm-config: lib/libLLVMSupport.a
tools/llvm-config/CMakeFiles/CMakeRelink.dir/llvm-config: tools/llvm-config/CMakeFiles/llvm-config.dir/build.make
tools/llvm-config/CMakeFiles/CMakeRelink.dir/llvm-config: tools/llvm-config/CMakeFiles/llvm-config.dir/relink.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable CMakeFiles/CMakeRelink.dir/llvm-config"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm-config.dir/relink.txt --verbose=$(VERBOSE)

# Rule to relink during preinstall.
tools/llvm-config/CMakeFiles/llvm-config.dir/preinstall: tools/llvm-config/CMakeFiles/CMakeRelink.dir/llvm-config
.PHONY : tools/llvm-config/CMakeFiles/llvm-config.dir/preinstall

tools/llvm-config/CMakeFiles/llvm-config.dir/requires: tools/llvm-config/CMakeFiles/llvm-config.dir/llvm-config.cpp.o.requires
.PHONY : tools/llvm-config/CMakeFiles/llvm-config.dir/requires

tools/llvm-config/CMakeFiles/llvm-config.dir/clean:
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config && $(CMAKE_COMMAND) -P CMakeFiles/llvm-config.dir/cmake_clean.cmake
.PHONY : tools/llvm-config/CMakeFiles/llvm-config.dir/clean

tools/llvm-config/CMakeFiles/llvm-config.dir/depend: tools/llvm-config/BuildVariables.inc
	cd /home/sraghave/drivers/opencl/compiler/llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sraghave/drivers/opencl/compiler/llvm /home/sraghave/drivers/opencl/compiler/llvm/tools/llvm-config /home/sraghave/drivers/opencl/compiler/llvm/build /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config /home/sraghave/drivers/opencl/compiler/llvm/build/tools/llvm-config/CMakeFiles/llvm-config.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/llvm-config/CMakeFiles/llvm-config.dir/depend

