#!/bin/bash

. ./CONFIG
. ./CONFIG.volume

# remove share config file
rm "${SHARE_CONFIG_FILE}"

# TODO: remove shared volume?
# rm -rf "${SHARED_VOLUME}"
