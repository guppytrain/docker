#!/bin/bash

# PRE INSTALL

echo "Starting apt updates"

apt-get upgrade
apt-get install -y apt-utils

apt-get install -y bash bash-completion

apt-get install -y vim
apt-get install -y git

