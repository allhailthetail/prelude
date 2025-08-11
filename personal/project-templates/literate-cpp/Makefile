#=== Project‐specific settings: edit these as needed ==========================

# The compiler you want to use (gcc, clang, icc, etc.)
CXX        := g++

# Compiler flags:
#  -std=c++17 or c++20 or whatever standard you need
#  -Wall/Wextra/… your warning levels
#  -g or -O2 or -O3
#  -I<path> for any non‐system include directories
CXXFLAGS   := -std=c++20 -Wall -Wextra -g \
              -I$(HOME)/.local/include

# Linker flags:
#  -L<path> for any non‐system library directories
LDFLAGS    := -L$(HOME)/.local/lib

# Libraries to link against:
#  -lfoo -lbar …
LIBS       := -lboost_program_options

# List of your project’s source files
SRC        := src/main.cpp src/foo.cpp

# Name of the final executable
TARGET     := main

#=============================================================================

# Internal derived variables – you rarely need to change these
OBJ        := $(SRC:.cpp=.o)

# Default target: build the executable
all: $(TARGET)

# Link step: takes object files and creates $(TARGET)
$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS) $(LIBS)

# Debug build override:
#  * Switches compiler (to clang++)
#  * Changes optimization/debug flags
#  * Rebuilds the same $(TARGET)
debug: CXX      := clang++
debug: CXXFLAGS := -std=c++20 -O0 -g -Wall -Wextra \
                   -I$(HOME)/.local/include
debug: clean $(TARGET)

# Mark phony targets so make won't confuse them with files
.PHONY: all debug clean

# Remove the executable and object files
clean:
	rm -f $(TARGET) $(OBJ)
