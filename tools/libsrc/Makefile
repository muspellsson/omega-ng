MAPS = abyss.map arena.map circle.map city.map country.map court.map \
       dlair.map hedges.map house.map hovel.map mansion.map misle.map \
       skorch.map speak.map starview.map stormwat.map temple.map \
       thaumari.map woodmere.map whorfen.map

maps.dat: $(MAPS) ../crypt
	../crypt maps.dat $(MAPS)
	cp maps.dat ../../lib

../crypt: ../crypt.c
	cd ..; make
