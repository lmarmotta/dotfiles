#!/usr/bin/bash

# Try compile with shared libraries off.

cgns_path=/home/leonardo/opt/cgns_gnu/
hdf5_path=/home/leonardo/opt/hdf5_gnu/

compiler_mpicc=/usr/bin/mpicc
compiler_mpifc=/usr/bin/mpif90
compiler_mpicx=/usr/bin/mpicxx

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$cgns_path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$hdf5_path

./configure PETSC_ARCH=linux-gnu --with-cc=$compiler_mpicc             \
                                 --with-fc=$compiler_mpifc             \
                                 --with-cxx=$compiler_mpicx            \
                                 --with-shared-libraries               \
                                 --with-hdf5-dir=$hdf5_path            \
                                 --with-hdf5                           \
                                 --with-cgns-dir=$cgns_path            \
                                 --with-cgns                           \
                                 --with-scalar-type=complex            \
                                 --with-shared-libraries=0

make PETSC_DIR=/home/leonardo/GitHub/petsc PETSC_ARCH=linux-gnu all
make PETSC_DIR=/home/leonardo/GitHub/petsc PETSC_ARCH=linux-gnu check 
