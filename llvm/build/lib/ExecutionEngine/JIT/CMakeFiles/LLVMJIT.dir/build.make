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
include lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/depend.make

# Include the progress variables for this target.
include lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/progress.make

# Include the compile flags for this target's objects.
include lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/flags.make

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/flags.make
lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o: ../lib/ExecutionEngine/JIT/JIT.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sraghave/drivers/opencl/compiler/llvm/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMJIT.dir/JIT.cpp.o -c /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JIT.cpp

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMJIT.dir/JIT.cpp.i"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JIT.cpp > CMakeFiles/LLVMJIT.dir/JIT.cpp.i

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMJIT.dir/JIT.cpp.s"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JIT.cpp -o CMakeFiles/LLVMJIT.dir/JIT.cpp.s

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o.requires:
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o.requires

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o.provides: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o.requires
	$(MAKE) -f lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/build.make lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o.provides.build
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o.provides

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o.provides.build: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/flags.make
lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o: ../lib/ExecutionEngine/JIT/JITDwarfEmitter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sraghave/drivers/opencl/compiler/llvm/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o -c /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JITDwarfEmitter.cpp

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.i"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JITDwarfEmitter.cpp > CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.i

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.s"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JITDwarfEmitter.cpp -o CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.s

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o.requires:
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o.requires

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o.provides: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o.requires
	$(MAKE) -f lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/build.make lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o.provides.build
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o.provides

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o.provides.build: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/flags.make
lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o: ../lib/ExecutionEngine/JIT/JITEmitter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sraghave/drivers/opencl/compiler/llvm/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o -c /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JITEmitter.cpp

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.i"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JITEmitter.cpp > CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.i

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.s"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JITEmitter.cpp -o CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.s

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o.requires:
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o.requires

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o.provides: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o.requires
	$(MAKE) -f lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/build.make lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o.provides.build
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o.provides

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o.provides.build: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/flags.make
lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o: ../lib/ExecutionEngine/JIT/JITMemoryManager.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sraghave/drivers/opencl/compiler/llvm/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o -c /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JITMemoryManager.cpp

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.i"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JITMemoryManager.cpp > CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.i

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.s"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT/JITMemoryManager.cpp -o CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.s

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o.requires:
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o.requires

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o.provides: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o.requires
	$(MAKE) -f lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/build.make lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o.provides.build
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o.provides

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o.provides.build: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o

# Object files for target LLVMJIT
LLVMJIT_OBJECTS = \
"CMakeFiles/LLVMJIT.dir/JIT.cpp.o" \
"CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o" \
"CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o" \
"CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o"

# External object files for target LLVMJIT
LLVMJIT_EXTERNAL_OBJECTS =

lib/libLLVMJIT.a: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o
lib/libLLVMJIT.a: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o
lib/libLLVMJIT.a: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o
lib/libLLVMJIT.a: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o
lib/libLLVMJIT.a: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/build.make
lib/libLLVMJIT.a: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library ../../libLLVMJIT.a"
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && $(CMAKE_COMMAND) -P CMakeFiles/LLVMJIT.dir/cmake_clean_target.cmake
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LLVMJIT.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/build: lib/libLLVMJIT.a
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/build

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/requires: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JIT.cpp.o.requires
lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/requires: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITDwarfEmitter.cpp.o.requires
lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/requires: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITEmitter.cpp.o.requires
lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/requires: lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/JITMemoryManager.cpp.o.requires
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/requires

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/clean:
	cd /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT && $(CMAKE_COMMAND) -P CMakeFiles/LLVMJIT.dir/cmake_clean.cmake
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/clean

lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/depend:
	cd /home/sraghave/drivers/opencl/compiler/llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sraghave/drivers/opencl/compiler/llvm /home/sraghave/drivers/opencl/compiler/llvm/lib/ExecutionEngine/JIT /home/sraghave/drivers/opencl/compiler/llvm/build /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT /home/sraghave/drivers/opencl/compiler/llvm/build/lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/depend

