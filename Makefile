# Defining variables
CC = $(shell which clang 2>/dev/null || which gcc) # Tries to find clang, otherwise uses gcc
CXX = $(shell which clang++ 2>/dev/null || which g++)
CFLAGS = -O3 -Wall -g -lpython3.13 # Compiler flags (enable all warnings and debug info)
LDFLAGS =          # Linker flags (none for now)
SRC_DIR = src      # Source directory
BUILD_DIR = build  # Build directory
LAUNCHER_SRC = launcher/launcher_conf.c # Launcher source file
LAUNCHER_EXEC = build/launcher   # Final executable
PYTHON_FILE = launcher/launcher.pyx      # Python file to copy
BUILD_SRC_DIR = build/src        # Directory to copy source files into
PYTHON_BIN = build/src/launcher/launcher.so  # Compiled Python file (launcher.so or .pyd depending on OS)
LAUNCHER_DIR = launcher
# Files to copy
SRC_FILES = $(wildcard $(SRC_DIR)/**/*)  # Find all files in the src directory

# Defining the final target (what will be created)
all: $(LAUNCHER_EXEC)$(PYTHON_BIN) copy_files  # Default target, compiles and copies files
# Compile C code to generate the 'launcher' executable
$(LAUNCHER_EXEC): $(LAUNCHER_SRC)
	mkdir -p $(BUILD_DIR)  # Create build directory if it doesn't exist
	$(CC) $(CFLAGS) -o $(LAUNCHER_EXEC) $(LAUNCHER_SRC) # Compile using the selected compiler
# Compile Python code using Cython
$(PYTHON_BIN): $(PYTHON_FILE)
	mkdir -p build/src/launcher  # Create build directory for Python binaries
	cython --directive language_level=3 --cplus $(PYTHON_FILE) --embed -o build/launcher.cpp  # Generate C++ file from Python (.pyx)
	$(CXX) $(CFLAGS) -o $(PYTHON_BIN) build/launcher.cpp $(shell python3-config --cflags --ldflags)  # Compile C file into executable
	rm -f build/launcher.c  # Clean up the generated C file
# Copy files and directories
copy_files:
	mkdir -p $(BUILD_SRC_DIR)  # Create source directory inside build
	cp -r src/* build/src  # Copy all source files to the build directory
	cp $(PYTHON_FILE) build/src/launcher  # Copy the launcher.py file to the build directory

# Clean up build directory
clean:
	rm -rf $(BUILD_DIR)  # Remove the entire build directory

# Run the launcher after compiling
run: $(LAUNCHER_EXEC)
	build/launcher  # Run the launcher executable

# Default target
.PHONY: all clean run copy_files  # Mark these as non-file targets
