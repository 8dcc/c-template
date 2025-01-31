
CC=gcc
CFLAGS=-std=c99 -Wall -Wextra -Wpedantic -ggdb3
LDLIBS=

# TODO: Add object files and rename
SRC=main.c
OBJ=$(addprefix obj/, $(addsuffix .o, $(SRC)))

BIN=output.out

# TODO: Remove install target when not necessary
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin

#-------------------------------------------------------------------------------

.PHONY: all clean install

all: $(BIN)

clean:
	rm -f $(OBJ)
	rm -f $(BIN)

install: $(BIN)
	install -D -m 755 $^ -t $(DESTDIR)$(BINDIR)

#-------------------------------------------------------------------------------

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

obj/%.c.o : src/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -o $@ -c $<
