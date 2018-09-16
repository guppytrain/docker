#!/bin/bash

. ./CONFIG
. ./CONFIG.volume
. ./CONFIG.bash

# create shared volume
if [ ! -d "${SHARED_VOLUME}" ]; then
    echo "Creating shared volume: "${SHARED_VOLUME}""
    mkdir -p "${SHARED_VOLUME}"
else
    echo "Reusing existing shared volume: "${SHARED_VOLUME}""
fi

# clean slate for share config file
echo "" > "${SHARE_CONFIG_FILE}"

# cat config(s) in the share config file
echo "# Docker shell config and vars" >> "${SHARE_CONFIG_FILE}"
cat "${VOLUME_CONFIG_FILE}" >> "${SHARE_CONFIG_FILE}"

printf "\n" >> "${SHARE_CONFIG_FILE}"

# bash completion
# cat completion wrappers in the share config file
echo "# Docker machine and compose completion helpers" >> "${SHARE_CONFIG_FILE}"
cat "${BASH_CONFIG_FILE}" >> "${SHARE_CONFIG_FILE}"


