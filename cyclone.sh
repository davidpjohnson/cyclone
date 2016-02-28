#!/bin/bash

# Placement
mv bashrc ~/.bashrc
mv vimrc ~/.vimrc
./install

# Download
rsync root@159.203.2.193:/home/yojimbo/bkup/projects.tar.gz /              
rsync root@159.203.2.193:/home/yojimbo/bkup/scripts.tar.gz  ~/

# unpack
cd /
tar xvf projects.tar.gz
cd 
tar xvf scripts.tar.gz



