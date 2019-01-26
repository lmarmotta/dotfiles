#!/bin/bash

# Configure a raw Manjaro installation with nvidia drivers configured.


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "          Installing All Dependencies for Open Suse Leap                 "
echo "                       Please Wait ...                                   "
echo "-------------------------------------------------------------------------"


#==============================================================================
# Commands that will be used during installation.

command='sudo pacman -S '

echo ""
echo "-------------------------------------------------------------------------"
echo " Update the system "

sudo pacman -Syu

echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo " Installing General stuff..." 

#==============================================================================
# General installation.

$command vim
$command gnuplot 
$command tmux
$command powerline
$command cgns
$command paraview
$command git 
$command texlive-bibtexextra 
$command texlive-bin 
$command texlive-core 
$command texlive-fontsextra 
$command texlive-langextra 
$command texlive-langgreek 
$command texlive-pictures
$command powerline-vim
$command bash-completion

$command xorg-fonts-75dpi
$command xorg-fonts-100dpi
$command autoconf
$command automake
$command bison
$command flex
$command m4
$command make
$command patch
$command gcc-fortran
$command arpack
$command tcsh
$command cpio
$command python
$command freetype vim-latexsuite htop librtmp0 lib32-librtmp0 cpio libzapojit 
$command libzip libzmf libzdb libzen 
$command gdb valgrind k3b
