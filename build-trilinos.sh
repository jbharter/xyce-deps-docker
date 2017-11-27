#!/bin/bash

DIR=$(pwd)
git clone https://github.com/trilinos/Trilinos.git
cd Trilinos
git checkout master

mkdir target
cd target

cmake \
-DCMAKE_C_COMPILER=$(which gcc) \
-DCMAKE_CXX_COMPILER=$(which g++) \
-DCMAKE_Fortran_COMPILER=$(which gfortran) \
-DTrilinos_ENABLE_ALL_PACKAGES=ON \
-DCMAKE_INSTALL_PATH=/usr/local/trilinos \
../

make -j4 install

cd $DIR
