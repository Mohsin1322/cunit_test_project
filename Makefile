CC=gcc
CFLAGS=-Wall -Wextra -std=c99
SRCDIR=src
TESTDIR=tests
UNITYDIR=unity

# Source files
SOURCES=$(wildcard $(SRCDIR)/*.c)
OBJECTS=$(SOURCES:.c=.o)

# Test files
TEST_SOURCES=$(wildcard $(TESTDIR)/*.c)
TEST_OBJECTS=$(TEST_SOURCES:.c=.o)

# Unity files
UNITY_SOURCES=$(UNITYDIR)/unity.c
UNITY_OBJECTS=$(UNITY_SOURCES:.c=.o)

# Main executable
TARGET=calculator

# Test executable
TEST_TARGET=test_runner

.PHONY: all test clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(filter-out $(SRCDIR)/main.o, $(OBJECTS)) $(TEST_OBJECTS) $(UNITY_OBJECTS)
	$(CC) $^ -o $(TEST_TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(UNITY_OBJECTS) $(TARGET) $(TEST_TARGET)

install-deps:
	# Install any dependencies if needed
	@echo "No additional dependencies needed for this project"
