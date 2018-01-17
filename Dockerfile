FROM ubuntu:latest

MAINTAINER Joshua Guan

RUN apt-get clean -y && apt-get -y update && apt-get -y install git gcc stress siege make build-essential autoconf automake libpcre3-dev libevent-dev pkg-config zlib1g-dev

RUN git clone https://github.com/kdlucas/byte-unixbench.git && git clone https://github.com/RedisLabs/memtier_benchmark.git
RUN mv byte-unixbench/UnixBench/* . && make
RUN cd memtier_benchmark && autoreconf -ivf && ./configure && make && make install