#!/bin/bash
# This script copies v, vp, vs, and vx to /usr/bin/
user=$1

install ()
{
    echo "[+] Installing..."
    cp sv /usr/bin/
    cp vp /usr/bin/
    cp vs /usr/bin/
    cp vx /usr/bin/
    cp vpx /usr/bin/
    cp vsx /usr/bin/
    mv vimrc ~/.vimrc
    mv bashrc ~/.bashrc
    rsync root@159.203.2.193:/home/yojimbo/bkup/projects.tar.gz /tmp/
    rsync root@159.203.2.193:/home/yojimbo/bkup/scripts.tar.gz /tmp/
    cd /tmp
    tar xvf projects.tar.gz
    tar xvf scripts.tar.gz
    mv projects /projects
    mv scripts /home/$user/scripts 
}

distro=$(cut -f2 -d"(" /proc/version | cut -f1 -d"-") 

if [ $distro == "debian" ]; then 
    apt-get install -y vim
    install
elif [ $distro == "ubuntu" ]; then
    apt-get install -y vim
    install
elif [ $distro == "fedora" ]; then
    dnf install vim
    echo "word"
fi
