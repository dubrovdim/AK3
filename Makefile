CXX      ?= g++
AR       ?= ar
CMAKE    ?= cmake
CPPFLAGS := -I.
CXXFLAGS := -std=c++17 -O2 -Wall -Wextra -pedantic

BUILD_DIR := build
OBJ_DIR   := $(BUILD_DIR)/obj
LIB_DIR   := $(BUILD_DIR)/lib
BIN_DIR   := $(BUILD_DIR)/bin

LIBRARY    := $(LIB_DIR)/libcalculator.a
EXECUTABLE := $(BIN_DIR)/calc_app

.PHONY: all clean dirs
all: $(LIBRARY) $(EXECUTABLE)

dirs:
	@$(CMAKE) -E make_directory $(OBJ_DIR) $(LIB_DIR) $(BIN_DIR)

$(OBJ_DIR)/calculator.o: calculator.cpp calculator.h | dirs
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/main.o: main.cpp calculator.h | dirs
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

$(LIBRARY): $(OBJ_DIR)/calculator.o | dirs
	$(AR) rcs $@ $^

$(EXECUTABLE): $(OBJ_DIR)/main.o $(LIBRARY) | dirs
	$(CXX) $^ -o $@

clean:
	$(CMAKE) -E rm -rf $(BUILD_DIR)
