#!/bin/bash

# Configure a raw OpenSUSE installation.
# Edited by Leonardo 29/06/2016  [OpenSUSE Leap 42.1]
# Updated by Leonardo 11/02/2016 [OpenSUSE Leap 42.2]


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "          Installing All Dependencies for Open Suse Leap                 "
echo "                       Please Wait ...                                   "
echo "-------------------------------------------------------------------------"


#==============================================================================
# Commands that will be used during installation.

command='sudo zypper -non-iteractive -no-gpg-checks install '
repo_command='sudo zypper ar --check --refresh '


#==============================================================================
# Config repos...


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo " Updating system...                                                      "

# Updating system from a raw-installation
sudo zypper refresh
sudo zypper update


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo " Config Repos..."

# Packman repo.
$repo_command http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_42.2/ Packman-Repository
sudo zypper refresh

# Science repo.
$repo_command http://download.opensuse.org/repositories/science/openSUSE_Leap_42.2/ Science
sudo zypper refresh

# Adobe Flash plugin - I hate you but I need you.
$repo_command http://linuxdownload.adobe.com/linux/x86_64/ Adobe
sudo zypper refresh

# I need you for some fancy compilation.
$repo_command http://opensuse-guide.org/repo/openSUSE_Tumbleweed/ libdvdcss-repository
sudo zypper refresh

# Installing utilities package.
$repo_command http://download.opensuse.org/repositories/utilities/openSUSE_Leap_42.2/ Utilities
sudo zypper refresh

# Nvidia Drivers.
$repo_command http://http.download.nvidia.com/opensuse/leap/42.2/ NVIDIA
sudo zypper refresh

# Bumblebee driver.
sudo zypper addrepo http://download.opensuse.org/repositories/X11:Bumblebee/openSUSE_Leap_42.2/X11:Bumblebee.repo
sudo zypper refresh

# Make shure everything is ok...
sudo zypper up


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "Installing Nvidia drivers..."

#==============================================================================
# Install Bumblebee and Nvidia Drivers.
# Instructions: https://en.opensuse.org/index.php?title=SDB:NVIDIA_Bumblebee&oldid=118653

sudo zypper in linux-glibc-devel
sudo zypper in -t pattern devel_kernel
sudo zypper in nvidia-bumblebee
sudo systemctl enable dkms
sudo zypper in nvidia-bumblebee-32bit


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "Installing fucking Flash player..."

#==============================================================================
# Install adobe flash plugin.

sudo zypper se -s -r Adobe
sudo zypper in adobe-release-x86_64
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo zypper in flash-plugin


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "Installing General stuff..." 

#==============================================================================
# General installation.

# I like firefox but chromium is faster...
$command chromium

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

# Installing Developing Enviroment.
$command vim-plugin-colorschemes   # Beautiful colours for my vim <3
$command vim-plugin-latex          # Latex plugin for my vim <3
$command tmux                      # Terminal Splitter
$command htop                      # Pratical terminal resource monitor
$command gdb                       # Command line type debugger
$command clipboard                 # Trying to fix vim clipboard
$command cmake                     # Good building auxiliar.
$command git                       #
$command git-core                  # Source version control.
$command git-svn                   #
$command kdiff3                    # Merging tool.
$command lapack                    # Damn fast library.
$command valgrind                  # Memory debugging.
$command tcl                       # Some graphical interfaces need it.

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
$command hdf5 hdf5-1_8-devel

# Installing CAE Packages.
$command libXinerama1-32bit
$command -t pattern 32bit
$command Mesa
$command Mesa-libGL1-32bit

# Installing MPI library (openmpi).
# Remember to setup the PATH:
# "export PATH=/usr/lib64/mpi/gcc/openmpi/bin:$PATH"
$command openmpi
$command openmpi-libs
$command lam
$command lam-devel
$command automake

# Export the necessary alias.
alias01="alias l='ls-l'"
echo $alias01>>.bashrc


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "Installing Spotfy..."

#==============================================================================
# Spotfy installation.

sudo zypper refresh
sudo zypper update

# Install necessary packages
$command libqt4 libqt4-x11 wget

# Install necessary libraries
cd /usr/lib64
wget https://dl.dropboxusercontent.com/u/8593574/Spotify/openSUSE/13.2/libgcrypt.so.11
ldconfig

# Download and install Spotify stable (v 0.9.17)
cd /opt
wget https://dl.dropboxusercontent.com/u/8593574/Spotify/openSUSE/13.2/spotify.tar.bz2
tar -jxvf ./spotify.tar.bz2
rm ./spotify.tar.bz2
ln -s /opt/spotify/spotify-client/spotify /usr/bin/spotify

# Install icons (long line coming up)
xdg-icon-resource install --size 16 /opt/spotify/spotify-client/Icons/spotify-linux-16.png "spotify-client" && xdg-icon-resource install --size 22 /opt/spotify/spotify-client/Icons/spotify-linux-22.png "spotify-client" && xdg-icon-resource install --size 24 /opt/spotify/spotify-client/Icons/spotify-linux-24.png "spotify-client" && xdg-icon-resource install --size 32 /opt/spotify/spotify-client/Icons/spotify-linux-32.png "spotify-client" && xdg-icon-resource install --size 48 /opt/spotify/spotify-client/Icons/spotify-linux-48.png "spotify-client" && xdg-icon-resource install --size 64 /opt/spotify/spotify-client/Icons/spotify-linux-64.png "spotify-client" && xdg-icon-resource install --size 128 /opt/spotify/spotify-client/Icons/spotify-linux-128.png "spotify-client" && xdg-icon-resource install --size 256 /opt/spotify/spotify-client/Icons/spotify-linux-256.png "spotify-client" && xdg-icon-resource install --size 512 /opt/spotify/spotify-client/Icons/spotify-linux-512.png "spotify-client"

# Add Spotify to the Applications menu
cp -p /opt/spotify/spotify-client/spotify.desktop /usr/share/applications/


echo ""
echo "-------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------"
echo "We are done now so... lets reboot the system  "
echo "-------------------------------------------------------------------------"

# Not Windows but, for shure, a refresh is ok.
sudo reboot
