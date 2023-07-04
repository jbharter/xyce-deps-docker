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
CPPFLAGS="-I/usr/include/suitesparse -I/usr/lib/xyce/serial/include" \
LDFLAGS="-L/usr/lib/xyce/serial/lib" \
CC=/usr/bin/gcc \
CXX=/usr/bin/g++ \
F77=/usr/bin/gfortran \
--prefix=/usr/lib/xyce/serial

make -j4
make install
cd $DIR
