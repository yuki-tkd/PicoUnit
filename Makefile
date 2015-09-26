PROGRAM_NAME := $(shell basename `pwd`)
 
# compiler
CXX := clang
CXXFLAGS := -O2 -Wextra
LIBS :=
 
# out
OUT_DIR := out
 
# program
PROGRAM_DIR := $(OUT_DIR)/bin
PROGRAM := $(PROGRAM_DIR)/$(PROGRAM_NAME)
 
# sources
SOURCE_DIR := src
SOURCES := $(wildcard $(SOURCE_DIR)/*.c)
SOURCE_NAMES = $(notdir $(SOURCES))
 
# headers
HEADER_DIR := include
HEADERS := $(wildcard $(HEADER_DIR)/*.h)
 
# objs
OBJ_DIR := $(OUT_DIR)/obj
OBJS := $(addprefix $(OBJ_DIR)/,$(SOURCE_NAMES:.c=.o))
 
# dependencies
DEPEND_DIR := $(OUT_DIR)/depend
DEPENDS := $(addprefix $(DEPEND_DIR)/,$(SOURCE_NAMES:.c=.depend))
 
.PHONY: all
all: $(DEPENDS) $(PROGRAM)
$(PROGRAM): $(OBJS)
		@mkdir -p $(PROGRAM_DIR)
		$(CXX) $(CXXFLAGS) $(LIBS) $^ -o $(PROGRAM)
 
$(DEPEND_DIR)/%.depend: $(SOURCE_DIR)/%.c $(HEADERS)
		@echo "generating $@"
		@mkdir -p $(DEPEND_DIR)
		@$(CXX) $(CXXFLAGS) $(LIBS) -I$(HEADER_DIR) -MM $< > $@
 
$(OBJ_DIR)/%.o: $(SOURCE_DIR)/%.c
		@mkdir -p $(OBJ_DIR)
		$(CXX) $(CXXFLAGS) $(LIBS) -I$(HEADER_DIR) -c $^ -o $@
 
 
ifneq "$(MAKECMDGOALS)" "clean"
-include $(DEPENDS)
endif
 
.PHONY : clean
clean:
		$(RM) -r $(OUT_DIR)
