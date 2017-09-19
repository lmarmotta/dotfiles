#!/bin/bash

echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "          Installing All Dependencies for Open Suse Leap                 "
echo "                       Please Wait ...                                   "
echo "-------------------------------------------------------------------------"

# Base command.
execute="sudo dnf "

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

