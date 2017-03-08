#!/bin/bash
argv=$1 
os=$(uname)
echo $os

basic ()
{
    echo "[+] Installing..."
    echo " "
    apt-get update
    apt-get install -y vim
    apt-get install -y guake
    apt-get install -y python3-dev
    aot-get install -y python-pip3
    cp vimrc ~/.vimrc
    cp bashrc ~/.bashrc
    echo "[+] Finished Installing...."
    echo " " 
}

advanced () {
    echo "[+] Installing advanced enviroment..."
    echo " "
    cd ~/
    if [ -d "tools" ]; then
        exit
    else
        mkdir tools
        cd tools
        git clone https://github.com/trustedsec/ptf.git
        git clone https://github.com/trustedsec/social-engineer-toolkit.git
        git clone https://github.com/trustedsec/artillery.git  
    fi 
}

echo "Determining Platform..."
# Be sure to add the spaces in your if statements
# For example [a == b] is bad
# The right was [ a == b ]
if [ $os == "Linux" ]; then
    echo $distro
    echo "Determining Distro...."
    distro=$(cut -f2 -d"(" /proc/version | cut -f1 -d"-") 
    if [ $distro == "debian" ]; then 
        basic
    elif [ $distro == "ubuntu" ]; then
        basic
    else
        echo "Sorry I only use apt-get."
        echo "dnf and yum is not supported"
    fi
elif [ $os == "Darwin" ]; then
    echo $distro
    cp vimrc ~/.vimrc
    cp bashrc ~/.bashrc


else
    echo "[!] Fatal Error"

fi

if [ $argv == "-a" ]; then
    if [ $os == "Linux" ]; then
        apt-get -y upgrade
        apt-get install -y nmap
        apt-get install -y wireshark
        advanced
    elif [ $os == "Darwin" ]; then
        brew install nmap
        advanced
    fi
else
    echo "[!] Fatal Error"
fi
