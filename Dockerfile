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
RUN apt-get install -y autoconf automake libcurl4-openssl-dev shtool doxygen

# Build cmake 3.9.x
COPY build-cmake.sh .
RUN ./build-cmake.sh

# Build ZLIB
COPY build-zlib.sh .
RUN ./build-zlib.sh

# Build HDF5
COPY build-hdf5.sh .
RUN ./build-hdf5.sh

# Build netCDF
COPY build-netcdf-c.sh .
RUN ./build-netcdf-c.sh

# Build Trilinos
COPY trilinos-12.6.3-Source.tar.bz2 .
COPY build-trilinos.sh .
RUN ./build-trilinos.sh
