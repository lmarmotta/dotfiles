#!/bin/bash

file1="post_input.dat"
file2="input.dat"

rm  bru3dv11 mp3d p_mp3d  datproc
ln -s ~/GitLab/BRU3D/a.out bru3dv11
ln -s ~/GitLab/BRU3D/tools/partitioner_3d/a.out mp3d
ln -s ~/GitLab/BRU3D/tools/post_processing/a.out p_mp3d
ln -s ~/GitLab/BRU3D/tools/datproc_mod_3/datproc datproc

if [ ! -e "$file1" ]; then 
    cp ~/GitLab/BRU3D/tools/post_processing/post_input.dat . 
else 
    echo "WARNING: 'post_input.sh' exists !"
fi

if [ ! -e "$file2" ]; then 
    cp ~/GitLab/BRU3D/tools/partitioner_3d/input.dat . 
else 
    echo "WARNING: 'input.sh' exists !"
fi
