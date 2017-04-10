#!/bin/bash
# This script will install basic, development, hacking and play
# environments. Basic is just as it sounds this will set up the bare
# bones environment and will always be installed. Development will 
# install more tools than basic. Hacking is as it sounds this will 
# install hacking tools. Play will install tools such as RTL-SDR this
# is where you will find randon tools.

# This script is cross platform and is split up to accomidate Unix and
# OS X. For example basic works on all platforms. Basic-unix is just
# for Unix and basic-osx is just for OS X.

# Concerning Unix
# I do not use Fedora or any distro that uses yum or DNF. There for I
# do not support those package managers. If you use vim you can 
# replace all instances of apt-get with yum or DNF with the following
# :%s/apt-get/dnf/g
# This hack should work but is untested

arg=$1      # Get Argument variable
os=$(uname) # Get OS

# Basic: Install basic tools and environments
basic () 
{
    # Set up environment
    cd Profiles
    cp vimrc ~/.vimrc
    cp bashrc ~/.bashrc
    cp gitconfig ~/.gitconfig # Will need to add username and email
    if [ ! -d ~/.vim/autoload ]; then
        mkdir -p ~/.vim/autoload
    fi  
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    if [ ! -f .git-prompt.sh ]; then
        curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
    fi
}

# Basic-Unix: Debian based only. 
basic-unix () 
{
    # Install tools
    apt-get -y update
    apt-get install -y vim
    apt-get install -y curl
    apt-get install -y guake
    apt-get install -y python3
    apt-get install -y python3-pip 
}    

# Development: Install dev tools and environments
development () 
{
    # Set up git environment
    # Install pathogen.vim
    # Install vim plugins
    if [ ! -d ~/.vim/bundle ]; then
        cd ~/.vim/bundle
        git clone https://github.com/tpope/vim-fugitive.git
        git clone https://github.com/airblade/vim-gitgutter.git
        git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
        git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
    else
        if [ ! -d ~/.vim/bundle/vim-fugitive ]; then
            git clone https://github.com/tpope/vim-fugitive.git
        fi
        if [ ! -d ~/.vim/bundle/vim-gitgutter ]; then
            git clone https://github.com/airblade/vim-gitgutter.git
        fi
        if [ ! -d ~/.vim/bundle/syntastic ]; then
            git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
        fi
        if [ ! -d ~/.vim/bundle/vim-airline ]; then
            git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
        fi
    fi 

}

# Development-Unix: Install Unix tools
development-unix () 
{
    # Install tools
    apt-get install -y git
    # apt-get install -y virtualbox
    apt-get install -y python3-dev
    apt-get install -y python-dev
    apt-get install -y python2-pip
}

# Hacking: Install hacking tools
hacking () 
{
    pip3 install scapy
    pip3 install paramiko
}

# Hacking-unix: Install unix hacking tools
hacking-unix () 
{
    # Make a home for tools
    apt-get install -y nmap
    apt-get install -y bluez
    apt-get install -y kismet
    apt-get install -y sqlite3
    apt-get install -y ubertooth 
    apt-get install -y wireshark
    apt-get install -y python-dbus
    apt-get install -y aircrack-ng
    apt-get install -y python-bluez
    apt-get install -y libsqlite3-dev
    apt-get install -y ruby-dev bundler
    ./scr/urpsuite_free_linux_v1_7_19.sh
    apt-get install -y bluez-teste-scripts
    cd && mkdir tools && cd ~/tools/
    git clone https://github.com/trustedsec/ptf.git
    git clone https://github.com/BinaryDefense/artillery.git
    git clone https://github.com/vanhauser-thc/thc-hydra.git
    git clone https://github.com/pwnieexpress/blue_hydra.git
    git clone https://github.com/trustedsec/social-engineer-toolkit.git
    curl http://www.openwall.com/john/j/john-1.8.0.tar.xz -o john-1.8.0.tar.gz
    git clone https://github.com/offensive-security/exploit-database.git /opt/exploit-database
    curl http://www.willhackforsushi.com/code/cowpatty/4.6/cowpatty-4.6.tgz -o ~/tools/cowpatty.tgz
    curl https://portswigger.net/Burp/Releases/Download?productId=100&version=1.7.19&type=Linux -o ~/tools/burp
    ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit
}

# Fun-unix: Install fun tools like SDR
fun-unix () 
{
    cd ~/
    mkdir SDR && cd SDR
    wget http://www.sbrac.org/files/build-gnuradio
    chmod a+x ./build-gnuradio && ./build-gnuradio
    add-apt-repository -y ppa:bladerf/bladerf
    add-apt-repository -y ppa:ettusresearch/uhd
    add-apt-repository -y ppa:myriadrf/drivers
    add-apt-repository -y ppa:myriadrf/gnuradio
    add-apt-repository -y ppa:gqrx/gqrx-sdr
    apt-get update
    apt-get install gqrx-sdr
}

installer () 
{
    if [ "$arg" == "" ]; then
        echo "[+] Installing basic..."
        basic
        if [ $os == 'Linux' ]; then
            echo "[+] Installing basic-unix..."
            basic-unix
        fi
    elif [ "$arg" == "-d" ]; then
        echo "[+] Installing development..."
        development
        if [ $os == 'Linux' ]; then
            echo "[+] Installing development-unix..."
            development-unix
        fi
    elif [ "$arg" == "-h" ]; then
        echo "[+] Installing hacking..."
        hacking
        if [ $os == 'Linux' ]; then
            echo "[+] Installing hacking-unix..."
            hacking-unix
        fi
    elif [ "$arg" == "-a" ]; then
        echo "[!] Damn dude installing all!"
        echo "[+] Prepare for this to take awhile!"
        basic
        basic-unix
        development
        development-unix
        hacking
        hacking-unix
        fun-unix
    fi
}

installer
clear
echo " "
echo " "
sleep  .80
echo "@@@ @@@   @@@@@@        @@@  @@@  @@@@@@@@@@   @@@@@@@    @@@@@@   "
sleep  .80
echo "@@@ @@@  @@@@@@@@       @@@  @@@  @@@@@@@@@@@  @@@@@@@@  @@@@@@@@  "
sleep  .100
echo "@@! !@@  @@!  @@@       @@!  @@!  @@! @@! @@!  @@!  @@@  @@!  @@@  "
sleep  .100
echo "!@! @!!  !@!  @!@       !@!  !@!  !@! !@! !@!  !@   @!@  !@!  @!@  "
sleep  .120
echo " !@!@!   @!@  !@!       !!@  !!@  @!! !!@ @!@  @!@!@!@   @!@  !@!  "
sleep  .120
echo "  @!!!   !@!  !!!       !!!  !!!  !@!   ! !@!  !!!@!!!!  !@!  !!!  "
sleep  .200
echo "  !!:    !!:  !!!       !!:  !!:  !!:     !!:  !!:  !!!  !!:  !!!  "
sleep  .240
echo "  :!:    :!:  !:!  !!:  :!:  :!:  :!:     :!:  :!:  !:!  :!:  !:!  "
sleep  .280
echo "   ::    ::::: ::  ::: : ::   ::  :::     ::    :: ::::  ::::: ::  "
sleep  .300
echo "   :      : :  :    : :::    :     :      :    :: : ::    : :  :   "
sleep  .340
echo " "
sleep  .380
echo " "
sleep  .400
echo " @@@@@@   @@@@@@@@   @@@@@@@  @@@  @@@  @@@@@@@   @@@  @@@@@@@  @@@ @@@  "
sleep  .100
echo "@@@@@@@   @@@@@@@@  @@@@@@@@  @@@  @@@  @@@@@@@@  @@@  @@@@@@@  @@@ @@@  "
sleep  .100
echo "!@@       @@!       !@@       @@!  @@@  @@!  @@@  @@!    @@!    @@! !@@  "
sleep  .120
echo "!@!       !@!       !@!       !@!  @!@  !@!  @!@  !@!    !@!    !@! @!!  "
sleep  .120
echo "!!@@!!    @!!!:!    !@!       @!@  !@!  @!@!!@!   !!@    @!!     !@!@!   "
sleep  .140
echo " !!@!!!   !!!!!:    !!!       !@!  !!!  !!@!@!    !!!    !!!      @!!!   "
sleep  .140
echo "     !:!  !!:       :!!       !!:  !!!  !!: :!!   !!:    !!:      !!:    "
sleep  .200
echo "    !:!   :!:       :!:       :!:  !:!  :!:  !:!  :!:    :!:      :!:    "
sleep  .200
echo ":::: ::    :: ::::   ::: :::  ::::: ::  ::   :::   ::     ::       ::    "
sleep  .240
echo ":: : :    : :: ::    :: :: :   : :  :    :   : :  :       :        :     "
sleep  .240
echo " "
sleep  .280
echo " "
sleep .280

