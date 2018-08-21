#!/bin/sh

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

cd /root/dev/linux/bin
[ -f "setup.sh" ] && ./setup.sh -n

