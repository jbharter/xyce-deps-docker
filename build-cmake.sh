#!/bin/bash

wget https://cmake.org/files/v3.9/cmake-3.9.1.tar.gz
tar -xzvf cmake-3.9.1.tar.gz
cd cmake-3.9.1/
./bootstrap
make
make install
cd ../
