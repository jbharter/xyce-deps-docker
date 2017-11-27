FROM ubuntu:trusty

MAINTAINER jbharter

RUN apt-get -y update
RUN apt-get install -y software-properties-common wget
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu trusty multiverse"
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y python gcc g++ gfortran make libsuitesparse-metis-dev git

# get_exotic_deps
RUN apt-get install -y bison flex libfftw3-dev libblas-dev libtool
# parallel_deps
RUN apt-get install -y libopenmpi-dev openmpi-bin libmetis-dev libparmetis-dev
# trilinos_deps
RUN apt-get install -y liblapack-dev libboost-all-dev
# misc_deps
RUN apt-get install -y autoconf libcurl4-openssl-dev

# Build cmake 3.9.x
RUN wget https://cmake.org/files/v3.9/cmake-3.9.1.tar.gz
RUN tar -xzvf cmake-3.9.1.tar.gz
RUN cd cmake-3.9.1/
RUN ./bootstrap
RUN make
RUN make install
RUN cd ../

# Build ZLIB
RUN wget http://www.zlib.net/zlib-1.2.11.tar.gz
RUN tar -xf zlib-1.2.11.tar.gz
RUN cd zlib-1.2.11
RUN ./configure --prefix=/usr/local
RUN make check
RUN make install
RUN cd ../


