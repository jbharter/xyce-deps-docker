#!/bin/bash

DIR=$(pwd)

tar -xf Xyce-6.8.tar.gz
cd Xyce-6.8

mkdir build
cd build
rm -rf *

../configure \
ARCHDIR=$HOME/XyceLibs/Parallel \
CXXFLAGS="-O3 -std=c++11" \
CPPFLAGS="-I/usr/include/suitesparse" \
--enable-mpi \
CC=/usr/bin/mpicc \
CXX=/usr/bin/mpic++ \
F77=/usr/bin/mpif77
--prefix=/usr/local/bin/xyce-parallel

make -j2
make install
cd $DIR
