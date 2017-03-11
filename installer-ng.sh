#!/bin/bash
# This script will install basic, development, hacking and play
# environments. Basic is just as it sounds this will set up the bare
# bones environment and will always be installed. Development will 
# install more tools than basic. Hacking is as it sounds this will 
# install hacking tools. Play will install tools such as RTL-SDR this
# is where you will find randon tools.


# Argument Variables $1, $2 exec
# Array ${!arr[*]}

arg=$1      # Get Argument variable
os=$(uname) # Get OS

# Basic: install basic tools and environments
basic () 
{
    echo "[+] Installing Basic..."
    # Install tools
    apt-get -y update
    apt-get install -y vim
    apt-get install -y guake
    apt-get install -y python3
    apt-get install -y python3-pip 
    # Set up environment
    cd Profiles
    cp vimrc ~/.vimrc
    cp bashrc ~/.bashrc
}

# Development: install dev tools and environments

development () 
{
    echo "[+] Installing Development..."
    # Install tools
    apt-get install -y git
    apt-get install -y python3-dev
    # Set up environment
    cp gitconfig ~/.gitconfig # Will need to add username and email
