#!/bin/bash

# make sure there is a dockerfile
if [ ! -f "./Dockerfile" ]; then
    echo "No Dockerfile found."
    sleep 5
    exit 1
fi

. ../CONFIG
. ./CONFIG

# remove command files
rm -rf "$CMD_DIR"
rm $BASE_CMD_DIR/*.cmd

# assign names
LOG="$(cat ${BUILT_FILE})"

TAGNAME="$(sed -n '3p' <(echo "$LOG"))"

FULL_IMAGE_NAME="$(sed -n '1p' <(echo "$LOG"))"

IMAGE_ID="$(sed -n '2p' <(echo "$LOG"))"

# remove tagged image and created containers
if [ -n "$TAGNAME" ]; then
    echo "Checking for containers built from "$TAGNAME""
    CNTRS="$(sudo docker container ls -a -q --filter=ancestor="$TAGNAME")"

    while IFS= read -r -d $'\n'; do
        [ -n "$REPLY" ] && (
            echo "Removing Container: $REPLY"
            echo "Removed Container: $(sudo docker container rm "$REPLY")"
        )
    done < <(echo "$CNTRS")

    if [ -z "$CNTRS" ]; then 
        echo "No tagged containers found"
    fi

    TAG="$(sudo docker image ls --format "{{.Repository}}:{{.Tag}}" "$TAGNAME")"

    # if [ -n "$TAG" ]; then
    if [ -n "$TAG" ] && [ $(( $(sed -n '$=' <(echo "$TAG")) )) -eq 1 ]; then
        echo "Removing tagged image $TAG"
        sudo docker image rm "$TAG"
    fi
fi

# remove full image and created containers
if [ -n "$FULL_IMAGE_NAME" ]; then
    echo "Checking for containers built from "$FULL_IMAGE_NAME""
    CNTRS="$(sudo docker container ls -a -q --filter=ancestor="$FULL_IMAGE_NAME")"

    while IFS= read -r -d $'\n'; do
        [ -n "$REPLY" ] && (
            echo "Removing Container: $REPLY"
            echo "Removed Container: $(sudo docker container rm "$REPLY")"
        )
    done < <(echo "$CNTRS")

    if [ -z "$CNTRS" ]; then
        echo "No formal containers found"
    fi

    IMG="$(sudo docker image ls --format "{{.Repository}}:{{.Tag}}" "$FULL_IMAGE_NAME")"

    # if [ -n "$IMG" ]; then
    if [ -n "$TAG" ] && [ $(( $(sed -n '$=' <(echo "$TAG")) )) -eq 1 ]; then
        echo "Removing full image $FULL_IMAGE_NAME"
        sudo docker image rm "$FULL_IMAGE_NAME"
    fi
fi

# remove id'ed image and created containers
if [ -n "$IMAGE_ID" ]; then
    echo "Checking for containers built from "$IMAGE_ID""
    CNTRS="$(sudo docker container ls -a -q --filter=ancestor="$IMAGE_ID")"

    while IFS= read -r -d $'\n'; do
        [ -n "$REPLY" ] && (
            echo "Removing Container: $REPLY"
            echo "Removed Container: $(sudo docker container rm "$REPLY")"
        )
    done < <(echo "$CNTRS")

    if [ -z "$CNTRS" ]; then
        echo "No formal containers found"
    fi

    if [ -n "$(sudo docker image ls -q | grep "$IMAGE_ID")" ]; then
        echo "Removing built image $IMAGE_ID"
        sudo docker image rm "$IMAGE_ID"
    fi
fi

