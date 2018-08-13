#!/bin/sh

# set -ex

. ./BUILD

echo "Building: ${USER}/${IMAGE}:${VERSION_MAJOR}${VERSION_MINOR}${MAJOR_MICRO}" 
sudo docker build -t "${USER}/${IMAGE}:${VERSION_MAJOR}${VERSION_MINOR}${MAJOR_MICRO}" .

echo "${USER}/${IMAGE}:${VERSION_MAJOR}${VERSION_MINOR}${MAJOR_MICRO}"

if [ -n "$1" ]; then
    echo "Applying custom tag: \"$1\""
    sudo docker tag "${USER}/${IMAGE}:${VERSION_MAJOR}${VERSION_MINOR}${MAJOR_MICRO}" "$1"

    echo "sudo docker run -it $1 bash" > "$HOME/dev/docker/docker.cmd"
else
    echo "sudo docker run -it "${USER}/${IMAGE}:${VERSION_MAJOR}${VERSION_MINOR}${MAJOR_MICRO}" bash" > "$HOME/dev/docker/docker.cmd"

    printf \
        "\n\n%s\n\n%s\n\n" \
        "No custom tag applied.  Tag this image with the following command:" \
        "sudo docker tag \"${USER}/${IMAGE}:${VERSION_MAJOR}${VERSION_MINOR}${MAJOR_MICRO}\" \"<CUSTOM_TAG>\""
fi
