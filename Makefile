CC=gcc
CFLAGS=-Wall -Wextra -std=c99
SRCDIR=src
TESTDIR=tests
UNITYDIR=unity

# Source files (exclude main.c for tests)
SOURCES=$(filter-out $(SRCDIR)/main.c, $(wildcard $(SRCDIR)/*.c))
OBJECTS=$(SOURCES:.c=.o)

# Test files
TEST_SOURCES=$(wildcard $(TESTDIR)/*.c)
TEST_OBJECTS=$(TEST_SOURCES:.c=.o)

# Unity files
UNITY_SOURCES=$(UNITYDIR)/unity.c
UNITY_OBJECTS=$(UNITY_SOURCES:.c=.o)

# Test executable
TEST_TARGET=test_runner

.PHONY: all test clean

all: test

test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(OBJECTS) $(TEST_OBJECTS) $(UNITY_OBJECTS)
	$(CC) $^ -o $(TEST_TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(UNITY_OBJECTS) $(TEST_TARGET)
	rm -f $(SRCDIR)/*.o $(TESTDIR)/*.o $(UNITYDIR)/*.o

install-deps:
	@echo "No additional dependencies needed for this project"
