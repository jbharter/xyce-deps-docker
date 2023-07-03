#!/bin/bash
set -e

DIR=$(pwd)

tar -xf Xyce-Release-7.6.0.tar.gz
cd Xyce-Release-7.6.0

./bootstrap

rm -rf build
mkdir build
cd build

../configure \
CXXFLAGS="-O3 -std=c++11" \
CPPFLAGS="-I/usr/include/suitesparse -I/usr/lib/xyce/parallel/include" \
LDFLAGS="-L/usr/lib/xyce/parallel/lib" \
--enable-mpi \
CC=/usr/bin/mpicc \
CXX=/usr/bin/mpic++ \
F77=/usr/bin/mpif77 \
--prefix=/usr/lib/xyce-parallel

make -j4
make install
cd $DIR
