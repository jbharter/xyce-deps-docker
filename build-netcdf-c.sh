#!/bin/bash

DIR=$(pwd)
git clone https://github.com/Unidata/netcdf-c.git
cd netcdf-c

git checkout master
CPPFLAGS=-I/usr/local/include LDFLAGS=-L/usr/local/lib ./configure --prefix=/usr/local
make check install

cd $DIR
