#!/bin/bash

# Get name of file to create
file=$1

make_file ()
{
    echo "#!/bin/bash" > $file
    vim $file
    sudo chmod 755 $file
}

if [ -a $file ]; then
    vim $file

else
    make_file

fi
