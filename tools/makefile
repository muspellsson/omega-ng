# The files in this directory are only useful to people who want to do
# development of omega - decrypt will take any of the encrypted files in
# ../omegalib and turn it into plain ascii, crypt will change the plain
# ascii file back into the encrypted format

# Run either one without any options to see usage instructions.  The
# encrypted files are expected to be stored in the omega lib directory
# and given names such as 'city.dat'; these names are the passwords which
# crypt is expecting.

CC = gcc -g -Wall -O2 -ansi

all: crypt decrypt makedate

crypt: crypt.c
	$(CC) $(CFLAGS) crypt.c bwt.c -o crypt

decrypt: decrypt.c
	$(CC) $(CFLAGS) decrypt.c -o decrypt

makedate: makedate.c
	$(CC) $(CFLAGS) makedate.c -o makedate

clean:
	rm -f crypt decrypt makedate
