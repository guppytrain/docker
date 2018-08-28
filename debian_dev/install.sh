#!/bin/bash

echo "Starting apt updates"

apt-get upgrade
apt-get install -y apt-utils

apt-get install -y git

echo "Done with apt updates"

cd /root/dev
git clone https://github.com/guppytrain/planter.git

# run setup
cd /root/dev/planter
[ -f "devseeds.sh" ] && ./devseeds.sh

# strip sudo if not there 
cd /root/dev/planter
[ -f "duso.sh" ] && ./duso.sh

cd /root/dev/linux/bin
[ -f "setup.sh" ] && ./setup.sh -n

. "$HOME/share/etc/.share_profile"

cd /root/dev/linux/bin # yea, yea...one extra cd, move on.
[ -f "base_install.sh" ] && ./base_install.sh

cd /root/dev/linux/bin/installers # yea, yea...one extra cd, move on.
[ -f "vim_plugins_install.sh" ] && ./vim_plugins_install.sh

if [ -n "$(which bash)" ]; then exec bash; else exec ${SHELL:-sh}; fi

