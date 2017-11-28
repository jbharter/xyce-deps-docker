#!/bin/bash

DIR=$(pwd)
wget https://github.com/trilinos/Trilinos/archive/trilinos-release-12-6-3.tar.gz
tar -xf Trilinos-trilinos-release-12-6-3.tar.gz
cd Trilinos-trilinos-release-12-6-3

#-D TPL_ENABLE_MPI=ON \
mkdir build
cd build
cmake \
-D CMAKE_C_COMPILER=$(which mpicc) \
-D CMAKE_CXX_COMPILER=$(which mpic++) \
-D CMAKE_Fortran_COMPILER=$(which gfortran) \
-D BUILD_SHARED_LIBS=ON \
-D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX:PATH=/usr/local \
-D Tpetra_INST_PTHREAD:BOOL=ON \
-D TPL_ENABLE_BoostLib=ON \
-D TPL_ENABLE_MPI=ON \
-D Trilinos_ENABLE_CXX11=ON \
-D Trilinos_ENABLE_TESTS=ON \
-D Trilinos_ENABLE_EXPLICIT_INSTANTIATION=ON \
-D Trilinos_ENABLE_STRONG_C_COMPILE_WARNINGS=OFF \
-D Trilinos_ENABLE_STRONG_CXX_COMPILE_WARNINGS=OFF \
-D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES=ON \
-D Trilinos_ENABLE_Teuchos=ON \
-D Trilinos_ENABLE_Trios=ON \
-D Trilinos_ENABLE_TriKota=ON \
-D Trilinos_ENABLE_Triutils=ON \
-D Trilinos_ENABLE_EpetraExt=ON \
-D Trilinos_ENABLE_TeuchosCore=ON \
-D Trilinos_ENABLE_TeuchosRemainder=ON \
-D Trilinos_ENABLE_TeuchosNumerics=ON \
-D Trilinos_ENABLE_TrilinosCouplings=ON \
-D Trilinos_ENABLE_Amesos=ON \
../

make -j4 install
cd $DIR
