#!/bin/bash
set -e

DIR=$(pwd)
#git clone https://github.com/Unidata/netcdf-c.git
wget https://github.com/Unidata/netcdf-c/archive/v4.5.0.tar.gz
tar -xf v4.5.0.tar.gz
cd netcdf-c-4.5.0
#mkdir target
#cd target
#cmake ../
CC=mpicc ./configure --prefix=/usr/local
make -j4
make install

cd $DIR
