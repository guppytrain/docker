#!/bin/bash

. ./CONFIG

# [_] create shared volume
if [ ! -d "${SHARED_VOLUME}" ]; then
    echo "Creating shared volume: "${SHARED_VOLUME}""
    mkdir -p "${SHARED_VOLUME}"
else
    echo "Reusing existing shared volume: "${SHARED_VOLUME}""
fi
