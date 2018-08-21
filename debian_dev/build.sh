#!/bin/sh

. ../CONFIG

. ./CONFIG

TAGNAME=${1:-$DEF_TAGNAME};

FULL_IMAGE_NAME="${USER}/${IMAGE}:${VERSION_MAJOR}${VERSION_MINOR}${VERSION_MICRO}"

echo "Building: ${FULL_IMAGE_NAME}" 
sudo docker build -t "${FULL_IMAGE_NAME}" .

if [ -n "$TAGNAME" ]; then
    echo "Applying custom tag: \"$TAGNAME\""
    sudo docker tag "${FULL_IMAGE_NAME}" "$TAGNAME"

    # echo "sudo docker run -it "${FULL_IMAGE_NAME}" bash" > "$HOME/dev/docker/docker.cmd"
    echo "sudo docker run -it $TAGNAME bash" > "$HOME/dev/docker/docker.cmd"
else
    printf \
        "\n\n%s\n\n%s\n\n" \
        "No custom tag applied.  Tag this image with the following command:" \
        "sudo docker tag \"${FULL_IMAGE_NAME}\" \"<CUSTOM_TAG>\""
fi

