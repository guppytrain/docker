#!/bin/bash

. ./CONFIG
. ./CONFIG.bash
. ./CONFIG.volume

# remove share config file
rm "${SHARE_CONFIG_FILE}"

# TODO: remove shared volume? NAH, for now
# rm -rf "${SHARED_VOLUME}"
