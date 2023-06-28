#!/bin/bash

DIR=$(pwd)

tar -xf Xyce-7.6.0.tar.gz
cd Xyce-7.6.0

mkdir build
cd build
rm -rf *

../configure \
ARCHDIR=$HOME/XyceLibs/Serial \
CXXFLAGS="-O3 -std=c++11" \
CPPFLAGS="-I/usr/include/suitesparse" \
CC=/usr/bin/gcc \
CXX=/usr/bin/g++ \
F77=/usr/bin/gfortran \
--prefix=/usr/local/bin/xyce-serial

make -j2
make install
cd $DIR
