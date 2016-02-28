#!/bin/bash
# This script copies v, vp, vs, and vx to /usr/bin/

user=$1

if [ $user == "" ]; then
    echo "[!] Error: Missing agument."
    echo "[!] Try: sudo ./install <username>"
    exit 1
fi

apt-get install -y vim
apt-get install -y guake
echo "[+] Installing..."
echo
cp sv /usr/bin/
cp vp /usr/bin/
cp vs /usr/bin/
cp vx /usr/bin/
cp vpx /usr/bin/
cp vsx /usr/bin/
cp vimrc /home/$user/.vimrc
cp bashrc /home/$user/.bashrc
rsync root@159.203.2.193:/home/yojimbo/bkup/projects.tar.gz /tmp/
rsync root@159.203.2.193:/home/yojimbo/bkup/scripts.tar.gz /tmp/
cd /tmp
tar xvf projects.tar.gz
tar xvf scripts.tar.gz
mv projects /projects
mv scripts /home/$user/scripts 
echo
echo
echo "[+] Finished Installing...."

A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A

