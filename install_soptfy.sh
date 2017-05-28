#!/bin/bash

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


