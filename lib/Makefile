MAPS = abyss.dat arena.dat circle.dat city.dat country.dat \
	court.dat dlair.dat home1.dat home2.dat home3.dat \
	maze1.dat maze2.dat maze3.dat maze4.dat misle.dat \
	speak.dat temple.dat village1.dat village2.dat village3.dat \
	village4.dat village5.dat village6.dat

all:
	cvs rm $(MAPS)

.map.dat:
	cd ../tools; make -f makefile
	../tools/crypt $@ > $@ < $<
