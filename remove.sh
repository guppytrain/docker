#!/bin/bash

. ./CONFIG

# remove share config file
rm "${SHARE_CONFIG_FILE}"

# TODO: remove shared volume?
# rm -rf "${SHARE_DIR}/docker"
