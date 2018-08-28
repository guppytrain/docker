#!/bin/sh

# get planter
cd /root/dev
git clone https://github.com/guppytrain/planter.git

# run setup
cd /root/dev/planter
[ -f "devseeds.sh" ] && ./devseeds.sh
[ -f "duso.sh" ] && ./duso.sh

cd /root/dev/linux/bin
[ -f "setup.sh" ] && ./setup.sh -n
[ -f "base_install.sh" ] && ./base_install.sh -n

