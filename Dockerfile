FROM ubuntu:16.04
MAINTAINER Javier Junquera <javier.junquera.sanchez@gmail.com>

WORKDIR /ntop

RUN apt-get update && \
  apt-get install -y \
  build-essential \
  git \
  bison \
  flex \
  libxml2-dev \
  libpcap-dev \
  libtool \
  libtool-bin \
  rrdtool \
  librrd-dev \
  autoconf \
  automake \
  autogen \
  redis-server \
  wget \
  libsqlite3-dev \
  libhiredis-dev \
  libgeoip-dev \
  libcurl4-openssl-dev \
  libpango1.0-dev \
  libcairo2-dev \
  libnetfilter-queue-dev \
  zlib1g-dev \
  libssl-dev \
  libcap-dev \
  libnetfilter-conntrack-dev \
  libtool-bin \
  libmysqlclient-dev \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ntop/nDPI.git nDPI && cd nDPI && git reset --hard d6176ff668504365674f8df04a36a2f35df2074b

RUN git clone https://github.com/ntop/ntopng.git ntopng && cd ntopng && git reset --hard a974988973c1ff4a999bbf583310e40c46d86e2a

COPY Makefile .

RUN make
# TODO make install

RUN ["chmod", "+x", "ntopng/ntopng"]

EXPOSE 5556
COPY start.sh .

ENTRYPOINT ["/ntop/start.sh"]
