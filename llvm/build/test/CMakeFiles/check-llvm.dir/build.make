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

# Utility rule file for check-llvm.

test/CMakeFiles/check-llvm:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sraghave/drivers/opencl/compiler/llvm/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Running the LLVM regression tests"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/test && /usr/bin/python /home/sraghave/drivers/opencl/compiler/llvm/utils/lit/lit.py --param build_config=. --param build_mode=. -sv --param llvm_site_config=/home/sraghave/drivers/opencl/compiler/llvm/build/test/lit.site.cfg --param llvm_unit_site_config=/home/sraghave/drivers/opencl/compiler/llvm/build/test/Unit/lit.site.cfg /home/sraghave/drivers/opencl/compiler/llvm/build/test

check-llvm: test/CMakeFiles/check-llvm
check-llvm: test/CMakeFiles/check-llvm.dir/build.make
.PHONY : check-llvm

# Rule to build all files generated by this target.
test/CMakeFiles/check-llvm.dir/build: check-llvm
.PHONY : test/CMakeFiles/check-llvm.dir/build

test/CMakeFiles/check-llvm.dir/clean:
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/test && $(CMAKE_COMMAND) -P CMakeFiles/check-llvm.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/check-llvm.dir/clean

test/CMakeFiles/check-llvm.dir/depend:
	cd /home/sraghave/drivers/opencl/compiler/llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sraghave/drivers/opencl/compiler/llvm /home/sraghave/drivers/opencl/compiler/llvm/test /home/sraghave/drivers/opencl/compiler/llvm/build /home/sraghave/drivers/opencl/compiler/llvm/build/test /home/sraghave/drivers/opencl/compiler/llvm/build/test/CMakeFiles/check-llvm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/check-llvm.dir/depend

