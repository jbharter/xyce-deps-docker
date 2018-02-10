#!/bin/bash

DIR=$(pwd)
git clone -b 1.10/master --single-branch https://bitbucket.hdfgroup.org/scm/hdffv/hdf5.git
cd hdf5
autoreconf --install
autoconf
CC=mpicc ./configure --with-zlib=/usr/local --prefix=/usr/local --enable-parallel
make -j4
make install
cd $DIR
