#!/bin/bash

# Configure a raw OpenSUSE installation.
# Updated by Leonardo 11/02/2016 [OpenSUSE Leap 42.3]


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "          Installing All Dependencies for Open Suse Leap                 "
echo "                       Please Wait ...                                   "
echo "-------------------------------------------------------------------------"


#==============================================================================
# Commands that will be used during installation.

command='sudo zypper -non-iteractive -no-gpg-checks install '


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo " Updating system...                                                      "

# Updating system from a raw-installation
sudo zypper refresh
sudo zypper update

# Add Packman repository.
sudo zypper addrepo -f http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_42.3/ Packman
sudo zypper refresh

# Science repository.
sudo zypper addrepo -f http://download.opensuse.org/repositories/science/openSUSE_Leap_42.3/ Science
sudo zypper refresh

# Some codecs.
sudo zypper addrepo -f http://opensuse-guide.org/repo/openSUSE_Leap_42.3/ Codecs
sudo zypper refresh


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "Installing General stuff..." 

#==============================================================================
# General installation.

# Installing Build Essentials.
$command --type pattern devel_basis
$command gcc-fortran

# Installing Latex Dependencies.
$command texlive-latex
$command texlive-latex-extra
$command texlive-tree-dvips
$command texlive-minted
$command texlive-scheme-full
sudo texhash  

# Gnome specific stuff.
$command gnome-tweak-tool dconf-editor

# Installing all the codecs and usefull stuff.
$command k3b-codecs 
$command ffmpeg 
$command lame 
$command gstreamer-plugins-bad 
$command gstreamer-plugins-ugly 
$command gstreamer-plugins-ugly-orig-addon 
$command gstreamer-plugins-libav 
$command libdvdcss2
$command g3data
$command vlc

# Installing Developing Enviroment.
$command vim-plugin-colorschemes   
$command vim-plugin-latex          
$command tmux                      
$command powerline                 
$command powerline-fonts           
$command vim-plugin-powerline      
$command tmux-powerline            
$command htop                      
$command gdb                       
$command clipboard                 
$command cmake                     
$command git                       
$command git-core                  
$command git-svn                   
$command kdiff3                    
$command lapack                    
$command valgrind                  
$command tcl                       

# Installing python dependencies
$command python3-Pygments
$command python-Pygments

# Installing Gnuplot
$command gnuplot
$command gnuplot-x11
$command libcairo2-dev 
$command libpango1.0-dev 
$command libwxgtk2.8-dev

# Dependencies for cgns.
$command opengl-games-utils
$command Mesa-libGL1
$command Mesa-libGL-devel
$command glu-devel
$command libXmu-devel

# Installing CAE Packages.
$command libXinerama1-32bit
$command -t pattern 32bit
$command Mesa
$command Mesa-libGL1-32bit

# Paraview build specifics.
$command vtk 
$command vtk-devel 
$command vtk-qt 
$command qt3-devel 
$command qt3-devel-tools 

# General libraries.
$command openmpi
$command openmpi-libs
$command lam
$command lam-devel
$command automake
$command perf
$command oprofile
$command tcl
$command tcl-devel
$command tcl-32bit
$command tk
$command tk-devel
$command tk-32bit


echo ""
echo "-------------------------------------------------------------------------"
echo "We are done now so... lets reboot the system  "
echo "-------------------------------------------------------------------------"

# Not Windows but, for shure, a refresh is ok.
sudo reboot
