#!/bin/bash

distro=$(cut -f2 -d"(" /proc/version | cut -f1 -d"-") 
os=$(uname)
echo $os
install ()
{
    echo $distro
    echo "[+] Installing..."
    echo
    apt-get install -y vim
    apt-get install -y nmap
    apt-get install -y guake
    apt-get install -y python-dev
    apt-get install -y python-pip
    aot-get install -y python-pip3
    pip install scapy
    pip install paramiko
    cp vimrc ~/.vimrc
    cp bashrc ~/.bashrc
    echo "[+] Finished Installing...."
    echo 
}
echo "Determining Platform..."

# Be sure to add the spaces in your if statements
# For example [a == b] is bad
# The right was [ a == b ]
if [ $os == "Linux" ]; then
    echo "Using Linux...."
    echo "Determining Distro...."
    if [ $distro == "debian" ]; then 
        install
    elif [ $distro == "ubuntu" ]; then
        install
    else
        echo "Sorry I only use apt-get."
        echo "dnf and yum is not supported"
    fi

elif [ $os == "Darwin" ]; then
    echo "Using OS X...."
    cp vimrc ~/.vimrc
    cp bashrc ~/.bashrc

else
    echo "[!] Fatal Error"

fi
