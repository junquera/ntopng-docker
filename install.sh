apt-get update
apt-get install build-essential git bison flex libxml2-dev libpcap-dev libtool libtool-bin rrdtool librrd-dev autoconf automake autogen redis-server wget libsqlite3-dev libhiredis-dev libgeoip-dev libcurl4-openssl-dev libpango1.0-dev libcairo2-dev libnetfilter-queue-dev zlib1g-dev libssl-dev libcap-dev libnetfilter-conntrack-dev libtool-bin git libmysqlclient-dev -y

cd nDPI && 
./autogen.sh && 
./configure &&
make

cd ../ntopng &&
./autogen.sh &&
./configure &&
make
