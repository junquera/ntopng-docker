# based on ubuntu 16.04 to run below's commands
FROM ubuntu:18.04
MAINTAINER Javier Junquera <javier.junquera.sanchez@gmail.com># this is the original author of this docker file

# declare the working directory by environment variable
ENV WORKDIR /ntop

# set working directory
WORKDIR ${WORKDIR}

# install packages that required for build
RUN apt-get update && \
  apt-get install -y \
  autoconf \
  autogen \
  automake \
  bison \
  build-essential \
  debhelper \
  dkms \
  dpkg-sig \
  flex \
  git \
  libcairo2-dev \
  libcap-dev \
  libcurl4-openssl-dev \
  libgeoip-dev \
  libhiredis-dev \
  libjson-c-dev \
  libmaxminddb0 \
  libmaxminddb-dev \
  libmysqlclient-dev \
  libncurses5-dev \
  libnetfilter-conntrack-dev \
  libnetfilter-queue-dev \
  libpango1.0-dev \
  libpcap-dev \
  libpng-dev \
  libreadline-dev \
  librrd-dev \
  libsqlite3-dev \
  libssl-dev \
  libtool \
  libtool-bin \
  libxml2-dev \
  libzmq3-dev \
  mmdb-bin \
  pkg-config \
  redis-server \
  rrdtool \
  wget \
  zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

# last stable version: 2.6-stable
# clone nDPI project with latest stable version
RUN git clone --branch 2.8-stable https://github.com/ntop/nDPI.git nDPI
# Trusting branch stability
# && cd nDPI && git reset --hard 7759f122a1aedd1249b021af3447bf5ade3636bf

# last stable version: 3.8-stable
# clone ntopng project with latest stable version
RUN git clone --branch 3.8-stable https://github.com/ntop/ntopng.git ntopng
# Trusting branch stability
# && cd ntopng && git reset --hard 4611a881b005077666f8099cd0cf010165ed1248

# copy a make script from local directory
COPY Makefile .

# compile program
RUN make -j48

# make compiled program has excutable permission
RUN ["chmod", "+x", "ntopng/ntopng"]

# copy a startup script from local directory inside docker
COPY start.sh .

# make startup script excutable
RUN ["chmod", "+x", "start.sh"]

# make docker can connect from host with specific port
EXPOSE 3000

RUN mkdir -p /var/lib/ntopng
RUN useradd ntopng
RUN chown ntopng:ntopng /var/lib/ntopng

# declare when run the docker, which sciprt need to call
ENTRYPOINT ${WORKDIR}"/start.sh"
