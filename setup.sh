#!/bin/sh

#
# Initialize Poky
#
if [ ! -d ./poky ]; then
    echo "--------- Clone poky --------- "
    git clone https://github.com/sirkt0131/poky.git -b gatesgarth
fi

cd poky
#
# Download repositories needed
#
if [ ! -d ./meta-intel ]; then
    echo "--------- Clone meta-intel --------- "
    git clone https://github.com/sirkt0131/meta-intel.git -b gatesgarth
fi
    
if [ ! -d ./meta-openembedded ]; then
    echo "--------- Clone meta-openembedded --------- "
    git clone https://github.com/sirkt0131/meta-openembedded.git -b gatesgarth
fi

if [ ! -d ./meta-python2 ]; then
    echo "--------- Clone python2 --------- "
    git clone https://github.com/sirkt0131/meta-python2.git -b gatesgarth
fi

if [ ! -d ./meta-ros ]; then
    echo "--------- Clone meta-ros --------- "
    git clone https://github.com/sirkt0131/meta-ros.git -b gatesgarth
fi

#
# Initialize environment
#
/bin/sh ./oe-init-build-env

#
# Setup configuration
#
cp -p ../conf/* build/conf/.

#
# Apply patches
#

#
# bitbake!
#
bitbake-layers show-layers