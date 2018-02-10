#!/bin/bash

wget http://www.zlib.net/zlib-1.2.11.tar.gz
tar -xf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=/usr/local
make -j4 check
make install
cd ../
