#!/bin/sh

docker build -t $DOCKERID/amazonlinux_base:latest -f Dockerfile.base .
