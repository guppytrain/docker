#!/bin/sh

# PRE INSTALL

echo "INSTALL: git" \
    && yum install -y bash bash-completion git \
    && yum install -y which \
    && yum install -y git \
    && echo "DONE: git"


