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
RUN apt-get install -y autoconf automake libcurl4-openssl-dev shtool doxygen graphviz libsuitesparse-dev

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

# Build Trilinos Serial
RUN wget https://github.com/trilinos/Trilinos/archive/trilinos-release-12-12-1.tar.gz
#COPY trilinos-release-12-12-1.tar.gz .
COPY build-trilinos-serial.sh .
RUN ./build-trilinos-serial.sh

# Build Trilinos Parallel
#COPY trilinos-release-12-12-1.tar.gz .
COPY build-trilinos-parallel.sh .
RUN ./build-trilinos-parallel.sh

# Build Xyce Serial
#COPY Xyce-6.8.tar.gz .
#COPY build-xyce-serial.sh .
#RUN ./build-xyce-serial.sh

# Build Xyce Parallel
#COPY Xyce-6.8.tar.gz .
#COPY build-xyce-parallel.sh .
#RUN ./build-xyce-parallel.sh
