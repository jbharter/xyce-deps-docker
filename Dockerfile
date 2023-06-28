FROM ubuntu:focal

MAINTAINER robtaylor

RUN apt-get -y update
RUN apt-get install -y software-properties-common wget
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu focal multiverse"
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y python gcc g++ gfortran make libsuitesparse-dev git cmake

# get_exotic_deps
RUN apt-get install -y bison flex libfftw3-dev libblas-dev libtool
# parallel_deps
RUN apt-get install -y libopenmpi-dev openmpi-bin libmetis-dev libparmetis-dev
# trilinos_deps
RUN apt-get install -y liblapack-dev libboost-all-dev
# misc_deps
RUN apt-get install -y autoconf automake libcurl4-openssl-dev shtool doxygen graphviz libsuitesparse-dev

# Build ZLIB
COPY build-zlib.sh .
RUN ./build-zlib.sh

# Build HDF5
COPY build-hdf5.sh .
RUN ./build-hdf5.sh

# Build netCDF
COPY build-netcdf-c.sh .
RUN ./build-netcdf-c.sh

# Build Trilinos Serial
RUN wget https://github.com/trilinos/Trilinos/archive/trilinos-release-12-12-1.tar.gz
#COPY trilinos-release-12-12-1.tar.gz .
COPY build-trilinos-serial.sh .
RUN ./build-trilinos-serial.sh

# Build Trilinos Parallel
#COPY trilinos-release-12-12-1.tar.gz .
COPY build-trilinos-parallel.sh .
RUN ./build-trilinos-parallel.sh

RUN wget https://github.com/Xyce/Xyce/archive/refs/tags/Release-7.6.0.tar.gz -O Xyce-Release-7.6.0.tar.gz
# Build Xyce Serial
#COPY build-xyce-serial.sh .
#RUN ./build-xyce-serial.sh

# Build Xyce Parallel
COPY build-xyce-parallel.sh .
RUN ./build-xyce-parallel.sh
