#!/bin/bash

# ------------------------------------------------------------------------------
# This script builds the libs needed to my academic life to work.
# Always run this script from the repo cloned dir.
# ------------------------------------------------------------------------------

# Change to current directory. Just reference. 

cd $(pwd)

# ------------------------------------------------------------------------------
# Start with petsc...
# ------------------------------------------------------------------------------

# Clone repository.
git clone https://bitbucket.org/petsc/petsc

# Export reference env variable.
export PETSC_DIR=$(pwd)/petsc

# Compile line.

INSTALL_DIR=/path/to/install
CC_DIR=/path/to/c/compiler # not mpi
CXX_DIR=/path/to/c/compiler # not mpi
FC_DIR=/path/to/fortran/compiler # not mpi
BLAS_DIR=/path/to/blas/libraris # you can use mkl.

# Choose one architecture, wisely.
ARCH_FLAG="PETSC_ARCH=linux-gnu-intel"
# ARCH_FLAG="PETSC_ARCH=linux-gnu"

# THE compiling line.
FC=$(which mpicc) CC=$(which mpicc) ./configure $(ARCH_FLAG) \
    --prefix=$(INSTALL_DIR) \
    --download-mpich \
    --with-scalar-type=complex \
    --with-cc=$(CC_DIR) \
    --with-fc=$(FC_DIR) \
    --with-cxx=$(CXX_DIR) \
    --with-blaslapack-dir=$(BLAS_DIR)

# Again, choose wisely and consistenty !
make PETSC_ARCH=linux-gnu-intel all test
# make PETSC_ARCH=linux-gnu all test
