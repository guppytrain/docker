#!/bin/sh

# get git
echo "INSTALL: git" \
    && yum install -y bash bash-completion git \
    && yum install -y git \
    && echo "DONE: git"

# get planter
git clone https://github.com/guppytrain/planter.git

