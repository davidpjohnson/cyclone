# cyclone

Cyclone downloads and installs my prefered configurations for bash, vim, and git. 
As well as downloads and installs tools I deam usefull. I strive to make the my 
work accessable to those who wish to customise. I will warn you however I do have
a bit of OCD and do some unnessary things to keep the script looking clean and neat.

###### Note: Debian based distros only
Do not support Fedora or any other yum/dnf based package mamagers. May someday add 
support for those distros.

###### Note: Mac OS X 
Mac OS X does have a little bit of support mostly vim and git. 

###### Note: Windows
Windows has a very basic Power Shell config to get rid of that blue backgroung and
give a more plesent Unix like shell. Future tools like Python and Git are in the
making.


#### How to Install:

Clone the reop.

`git clone https://github.com/davidpjohnson/cyclone.git`

#### How to use:

##### Linux or MAC
For a basic config and install use:

`sudo ./installer-ng.sh`

For a better development config/install and environment use:

`sudo installer-ng.sh -d`

For some hacking tools use:

`sudo installer-ng.sh -h`

For everything and some fun tools like SDR(Software defined radio) use:

`sudo installer-ng.sh -a`

###### Windows

To install on windows you must first download and install Git. With that done
git clone this repo. Before trying to run the installer make sure you have 
permisions set to do so. If you don't or don't know what I'm talking about
open up powershell as Administrator and run the following.

`Set-ExecutionPolicy Unrestricted`

There are other options than unrestricted and this can open up a security hole.
However, if you follow security best practices you will be fine. With permission
to execute scripts now set run the following.

`./installer-ng.ps1`


