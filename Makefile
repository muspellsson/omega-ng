CURSES_INC=$(shell pkg-config --variable=includedir ncurses)
CURSES_LIBS=$(shell pkg-config --libs ncurses)
CC=gcc
CPP=$(CC) -E
CFLAGS=-std=c11 -pedantic -Wall -O2 -I$(CURSES_INC) -DBSD -Werror=all -Wno-error=unused-but-set-variable

LDFLAGS=-L. $(CURSES_LIBS)

SOURCES = omega.c abyss.c aux1.c aux2.c aux3.c bank.c char.c city.c clrgen.c\
      command1.c command2.c command3.c country.c date.c effect1.c\
      effect2.c effect3.c etc.c env.c file.c gen1.c gen2.c guild1.c guild2.c\
      house.c init.c inv.c item.c itemf1.c itemf2.c itemf3.c lev.c map.c\
      mmelee.c mmove.c mon.c move.c movef.c mspec.c mstrike.c mtalk.c\
      newrand.c priest.c pdump.c save.c scr.c site1.c site2.c spell.c\
      stats.c time.c trap.c util.c village.c

OBJ = omega.o abyss.o aux1.o aux2.o aux3.o bank.o char.o city.o clrgen.o\
      command1.o command2.o command3.o country.o date.o effect1.o\
      effect2.o effect3.o etc.o env.o file.o gen1.o gen2.o guild1.o guild2.o\
      house.o init.o inv.o item.o itemf1.o itemf2.o itemf3.o lev.o map.o\
      mmelee.o mmove.o mon.o move.o movef.o mspec.o mstrike.o mtalk.o\
      newrand.o priest.o pdump.o save.o scr.o site1.o site2.o spell.o\
      stats.o time.o trap.o util.o village.o

all: maps genclr clrgen.o date $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LDFLAGS) -o omega

maps:
	$(CC) tools/crypt.c    -o tools/crypt
	$(CC) tools/decrypt.c  -o tools/decrypt
	$(CC) tools/makedate.c -o tools/makedate
	tools/crypt tools/libsrc/maps.dat tools/libsrc/*.map
	cp tools/libsrc/maps.dat lib/maps.dat

date: tools/makedate
	tools/makedate > date.c

genclr: genclr.o
	$(CC) $(LDFLAGS) genclr.o -o genclr
	$(CPP) $(CFLAGS) -DOMEGA_CLRGEN *.[ch] | ./genclr clrgen.c clrgen.h

tools/makedate: tools/makedate.c

clrgen.c clrgen.h: genclr

clrgen.o: clrgen.c

date.o: date.c

$(SOURCES): clrgen.h

clean:
	rm -f tools/libsrc/maps.dat
	rm -f libs/maps.dat
	rm -f *.o
	rm -f clrgen.c clrgen.h
	rm -f tools/crypt tools/decrypt tools/makedate
	rm -f genclr
	rm -f date.c
