#!/usr/bin/python3
"""@package docstring
Cyclone will install environment variables along with bash or power
shell configuration files for the appropriate Operating System. 
"""

from platform import system 

def determin_os():
    """Determin which Operation System is being used
    """
    os = system()

