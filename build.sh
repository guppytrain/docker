#!/bin/bash

# source the configs
. ../CONFIG
. ./CONFIG

# docker build forbids upward directory traversal, so symlink the next level up
# TMP_TGT="tmp"
# TMP_SRC="../common"
if [ ! -d "$TMP_TGT" ]; then
    echo "No TMP_TGT: ${TMP_TGT}, creating..."
    cp -r $TMP_SRC $TMP_TGT
fi

# BASE_CMD_DIR="../cmds"
# CMD_DIR="./cmds"
if [ ! -d "$CMD_DIR" ]; then
    echo "No CMD_DIR: ${CMD_DIR}, creating..."
    mkdir $CMD_DIR
fi

# define some stuff
TAGNAME=${1:-$TAG_NAME};
FULL_IMAGE_NAME="${USER}/${IMAGE}:${VERSION_MAJOR}${VERSION_MINOR}${VERSION_MICRO}"

# build the image, and log the name and id
echo "Building: ${FULL_IMAGE_NAME}" 
sudo docker build -t "${FULL_IMAGE_NAME}" .

printf "%s\n" "${FULL_IMAGE_NAME}" > "$BUILT_FILE" # overwrite contents anew

IMAGE_ID="$(sudo docker image ls -q -f dangling=false $FULL_IMAGE_NAME)"

printf "%s\n" "${IMAGE_ID}" >> "$BUILT_FILE" # must be append, not overwrite

echo "Image Info: ${FULL_IMAGE_NAME}, ${IMAGE_ID}"

# build the commands    
templates="$(cat ../cmds/TEMPLATES)"

# echo "sudo docker run -it "${FULL_IMAGE_NAME}" bash" > "$HOME/dev/docker/docker.cmd"
echo "Creating RUN_LATEST command"
# sed -n '/RUN_LATEST/p' <(echo "$templates") | sed -n "s/^RUN_LATEST=//; s/^\"//; s/\"$//; s@<IMG>@\"${TAGNAME}\"@;p" > "${CMD_DIR}/run_latest.cmd"
sed -n '/RUN_LATEST/p' <(echo "$templates") | sed -n "s/^RUN_LATEST=//; s/^\"//; s/\"$//; s@<IMG>@\"${FULL_IMAGE_NAME}\"@;p" > "${CMD_DIR}/run_latest.cmd"
# sed -n '/RUN_LATEST/p' <(echo "$templates") | sed -n "s/^RUN_LATEST=//; s/^\"//; s/\"$//; s/<IMG>/\"${IMAGE_ID}\"/;p" > "${CMD_DIR}/run_latest.cmd"
echo "RUN_LATEST cmd: $(cat ${CMD_DIR}/run_latest.cmd)"

# echo "sudo docker run -it $TAGNAME bash" > "$HOME/dev/docker/run_latest.cmd"
echo "Creating START_LATEST command"
# sed -n '/START_LATEST/p' <(echo "$templates") | sed -n "s/^START_LATEST=//; s/^\"//; s/\"$//; s@<IMG>@\"${TAGNAME}\"@;p" > "${CMD_DIR}/start_latest.cmd"
sed -n '/START_LATEST/p' <(echo "$templates") | sed -n "s/^START_LATEST=//; s/^\"//; s/\"$//; s@<IMG>@\"${FULL_IMAGE_NAME}\"@;p" > "${CMD_DIR}/start_latest.cmd"
# sed -n '/START_LATEST/p' <(echo "$templates") | sed -n "s/^START_LATEST=//; s/^\"//; s/\"$//; s/<IMG>/\"${IMAGE_ID}\"/;p" > "${CMD_DIR}/start_latest.cmd"
echo "START_LATEST cmd: $(cat ${CMD_DIR}/start_latest.cmd)"

chmod 755 ${CMD_DIR}/*

# copy commands to base folder; the latest specific build becomes the latest base build
cp "${CMD_DIR}/run_latest.cmd" "${BASE_CMD_DIR}/."
cp "${CMD_DIR}/start_latest.cmd" "${BASE_CMD_DIR}/."

# tagging
if [ -n "$TAGNAME" ]; then
    echo "Applying local tag: \"$TAGNAME\""
    sudo docker tag "${FULL_IMAGE_NAME}" "$TAGNAME"

    echo "Image Tag: ${TAGNAME}"

    printf "%s\n" "${TAGNAME}" >> "$BUILT_FILE" # must be append, not overwrite
else
    printf \
        "\n\n%s\n\n%s\n\n" \
        "No local tag applied.  Tag this image with the following command:" \
        "sudo docker tag \"${FULL_IMAGE_NAME}\" \"<TAG>\""
fi

# default tag
if [ -n "$DEF_TAG_NAME" ]; then
    echo "Applying default tag: \"$DEF_TAG_NAME\""
    sudo docker tag "${FULL_IMAGE_NAME}" "$DEF_TAG_NAME"

    echo "Default Image Tag: ${DEF_TAG_NAME}"
fi

# clean up...sort of
echo "Removing TMP_TGT: ${TMP_TGT}"
rm -rf $TMP_TGT

