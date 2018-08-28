#!/bin/bash

. ./CONFIG
. ./CONFIG.volume

# create shared volume
if [ ! -d "${SHARED_VOLUME}" ]; then
    echo "Creating shared volume: "${SHARED_VOLUME}""
    mkdir -p "${SHARED_VOLUME}"
else
    echo "Reusing existing shared volume: "${SHARED_VOLUME}""
fi

# cat config(s) in the share config file
echo "# Docker shell config and vars" > "${SHARE_CONFIG_FILE}"
cat "${VOLUME_CONFIG_FILE}" >> "${SHARE_CONFIG_FILE}"

