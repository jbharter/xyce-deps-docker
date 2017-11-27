#!/bin/bash

DIR=$(pwd)
git clone https://bitbucket.hdfgroup.org/scm/hdffv/hdf5.git
cd hdf5
git checkout master
autoconf
./configure --with-zlib=/usr/local --prefix=/usr/local
make
make install
cd $DIR
