#!/bin/sh

. ../CONFIG

. ./CONFIG

TAGNAME=${1:-$DEF_TAGNAME};

FULL_IMAGE_NAME="${USER}/${IMAGE}:${VERSION_MAJOR}${VERSION_MINOR}${VERSION_MICRO}"

if [ -n "$TAGNAME" ]; then
    echo "Checking for containers built from "$TAGNAME""
    CNTRS=$(sudo docker container ls -a -q --filter=ancestor="$TAGNAME")

    for c in $CNTRS; do 
        echo "Container: $c"
        sudo docker container rm $c
    done

    [ -z $CNTRS ] && echo "No tagged containers found"

    TAG=$(sudo docker image ls --format "{{.Repository}}:{{.Tag}}" "$DEF_TAGNAME")

    if [ -n "$TAG" ]; then
        echo "removing image $TAG"
        sudo docker image rm $TAG
    fi
fi

if [ -n "$FULL_IMAGE_NAME" ]; then
    echo "Checking for containers built from "$FULL_IMAGE_NAME""
    CNTRS=$(sudo docker container ls -a -q --filter=ancestor="$FULL_IMAGE_NAME")

    for c in $CNTRS; do 
        echo "Container: $c"
        sudo docker container rm $c
    done

    [ -z $CNTRS ] && echo "No formal containers found"

    IMG=$(sudo docker image ls --format "{{.Repository}}:{{.Tag}}" "$FULL_IMAGE_NAME")

    if [ -n "$IMG" ]; then
        echo "removing image $FULL_IMAGE_NAME"
        sudo docker image rm $FULL_IMAGE_NAME
    fi
fi

