CURSES_INC=/home/Ivan/PDCurses-3.4
CC=gcc
CPP=$(CC) -E
CFLAGS=-DMSDOS -std=c11 -ansi -pedantic -Wall -O2 -I$(CURSES_INC)

all:
	$(CC) tools/crypt.c    -o tools/crypt
	$(CC) tools/decrypt.c  -o tools/decrypt
	$(CC) tools/makedate.c -o tools/makedate
	#tools/crypt tools/libsrc/maps.dat tools/libsrc/*.map
	#cp tools/libsrc/maps.dat lib/maps.dat
	$(CC) $(CFLAGS) genclr.c -o genclr
	$(CPP) $(CFLAGS) -DOMEGA_CLRGEN *.[ch] | ./genclr clrgen.c clrgen.h

clean:
	rm clrgen.c clrgen.h
	rm tools/crypt tools/decrypt tools/makedate
	rm genclr