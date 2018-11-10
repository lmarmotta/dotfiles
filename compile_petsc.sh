#!/usr/bin/bash

# If you do not have your own cgns and hdf5 installation, 
# link it to your system.

current_path=/home/leonardo/GitHub/petsc

cgns_path=/usr/
hdf5_path=/usr/

compiler_mpicc=/usr/bin/mpicc
compiler_mpifc=/usr/bin/mpif90
compiler_mpicx=/usr/bin/mpicxx
compiler_mpiex=/usr/bin/mpiexec

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$cgns_path
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$hdf5_path

./configure PETSC_ARCH=linux-gnu --with-cc=$compiler_mpicc --with-fc=$compiler_mpifc --with-cxx=$compiler_mpicx --with-shared-libraries --with-hdf5-dir=$hdf5_path --with-hdf5 --with-cgns-dir=$cgns_path --with-cgns --with-scalar-type=complex --with-fortran-kernels=true --with-mpiexec=$compiler_mpiex

make PETSC_DIR=$current_path PETSC_ARCH=linux-gnu all
make PETSC_DIR=$current_path PETSC_ARCH=linux-gnu check 

export PETSC_DIR=/home/leonardo/GitHub/petsc
export PETSC_ARCH=linux-gnu

touch ~/test_log.txt

make -f gmakefile test PETSC_ARCH=$PETSC_ARCH | tee ~/test_log.txt
