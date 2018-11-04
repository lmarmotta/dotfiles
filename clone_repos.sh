#!/bin/bash

# ------------------------------------------------------------------------------
# My own repos.
# ------------------------------------------------------------------------------

cd $(pwd)

git clone https://github.com/lmarmotta/nozzle_2D.git
git clone https://github.com/lmarmotta/c_learning.git
git clone https://github.com/lmarmotta/cg_ascii.git
git clone https://github.com/lmarmotta/hpc_benchmark.git
git clone https://github.com/lmarmotta/gnuplot-scripts.git
git clone https://github.com/lmarmotta/unstr_ds.git
git clone https://github.com/lmarmotta/aux_writing.git
git clone https://github.com/lmarmotta/n.cfd_shock.tube1d.git
git clone https://github.com/lmarmotta/n.cfd_oblique.shock2d.git

# ------------------------------------------------------------------------------
# Libraries.
# ------------------------------------------------------------------------------

git clone -b master https://github.com/CGNS/CGNS.git 
git clone https://bitbucket.org/petsc/petsc
git clone https://bitbucket.org/slepc/slepc

# ------------------------------------------------------------------------------
# Software.
# ------------------------------------------------------------------------------

git clone https://github.com/su2code/SU2.git
git clone https://github.com/su2code/TestCases.git
git clone https://github.com/suavecode/Tutorials.git
git clone https://github.com/suavecode/SUAVE.git
git clone https://bitbucket.org/fathomteam/moab.git
