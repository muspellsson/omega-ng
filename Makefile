CURSES_INC=/home/Ivan/PDCurses-3.4
CC=gcc
CPP=$(CC) -E
CFLAGS=-DMSDOS -std=c11 -ansi -pedantic -Wall -O2 -I$(CURSES_INC)
LDFLAGS=-L. -lpdcurses

SOURCES = omega.c abyss.c aux1.c aux2.c aux3.c bank.c char.c city.c clrgen.c\
      command1.c command2.c command3.c country.c date.c effect1.c\
      effect2.c effect3.c etc.c env.c file.c gen1.c gen2.c guild1.c guild2.c\
      house.c init.c inv.c item.c itemf1.c itemf2.c itemf3.c lev.c map.c\
      mmelee.c mmove.c mon.c move.c movef.c mspec.c mstrike.c mtalk.c\
      newrand.c priest.c pdump.c save.c scr.c site1.c site2.c spell.c\
      stats.c time.c trap.c util.c village.c

all:
	$(CC) tools/crypt.c    -o tools/crypt
	$(CC) tools/decrypt.c  -o tools/decrypt
	$(CC) tools/makedate.c -o tools/makedate
	tools/crypt tools/libsrc/maps.dat tools/libsrc/*.map
	cp tools/libsrc/maps.dat lib/maps.dat
	$(CC) $(CFLAGS) genclr.c -o genclr
	$(CPP) $(CFLAGS) -DOMEGA_CLRGEN *.[ch] | ./genclr clrgen.c clrgen.h
	tools/makedate > date.c
	$(CC) $(CFLAGS) $(SOURCES) $(LDFLAGS) -o omega

clean:
	rm -f clrgen.c clrgen.h
	rm -f tools/crypt tools/decrypt tools/makedate
	rm -f genclr
	rm -f date.c