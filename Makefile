ntop: ndpi
	cd ntopng && ./autogen.sh && ./configure && make

ndpi:
	cd nDPI && ./autogen.sh && ./configure && make

all: ntop
	echo "¡Hecho!"
