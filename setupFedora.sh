#!/bin/bash

echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "          Installing All Dependencies for Fedora 26                      "
echo "                       Please Wait ...                                   "
echo "-------------------------------------------------------------------------"

# Base command.
execute="sudo dnf "

# Enable those non-free repos every distro have.
sudo rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-25.noarch.rpm

# Update the system.
$execute check-update
$execute update

# Install dev enviroment.
$execute sqlite
$execute gnuplot
$execute gcc-gfortran
$execute powerline
$execute tmux-powerline
$execute vim-powerline
$execute gnome-tweak-tool

# Install CAE devs.
$execute mesa*

# Install cfd libs.
$execute cgns*
$execute metis
$execute tcl*
$execute tk*
$execute tcsh

# Install other stuff.
$execute vlc

# Latex.
$execute texlive-scheme-full
texconfig rehash
