# EmpList — GnuCOBOL build
COBC     = cobc
SRC      = src/EMPLIST.CBL
BIN      = emplist
CFLAGS   = -x

.PHONY: all clean run

all: $(BIN)

$(BIN): $(SRC)
	$(COBC) $(CFLAGS) -o $(BIN) $(SRC)

run: $(BIN)
	./$(BIN)

clean:
	rm -f $(BIN) *.so *.o
