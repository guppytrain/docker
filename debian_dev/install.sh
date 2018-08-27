#!/bin/bash

echo "Starting apt updates"

apt-get upgrade
apt-get install -y apt-utils

apt-get install -y git

echo "Done with apt updates"

cd /root/dev
git clone https://github.com/guppytrain/planter.git

# strip sudo if not there 
if [ -z "$(which sudo)" ]; then 
    cd /root/dev/linux
    rp.sh -a sudo bin etc
fi

# run setup
cd /root/dev/planter
[ -f "devseeds.sh" ] && ./devseeds.sh

cd /root/dev/linux/bin
[ -f "setup.sh" ] && ./setup.sh -n

. "$HOME/share/etc/.share_profile"

cd /root/dev/linux/bin # yea, yea...one extra cd, move on.
[ -f "base_install.sh" ] && ./base_install.sh

if [ -n "$(which bash)" ]; then exec bash; else exec ${SHELL:-sh}; fi

