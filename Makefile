ntop: ndpi
	cd ntopng && ./autogen.sh && ./configure && make #-j48

ndpi:
	cd nDPI && ./autogen.sh && ./configure && make #-j48

all: ntop
	echo "¡Hecho!"
