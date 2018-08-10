#!/bin/sh

# ensure $HOME
if [ -z "$HOME" ]; then
	export HOME="$(cd ~; pwd)"
fi

DEV_DIR="$HOME/dev"

if [ ! -d "$DEV_DIR" ]; then
	echo "Creating $DEV_DIR ..."

	mkdir "$DEV_DIR"
fi

REPO_DIR="$DEV_DIR/linux"

if [ -d "$REPO_DIR" ]; then
	echo "Existing ${REPO_DIR}..."

	cd "$REPO_DIR"
	
	if [ -z "$(git status)" ] && [ -z "$(ls -A ".git")" ]; then
		echo "$REPO_DIR not a valid repo, cloning into it..."
		git clone "https://github.com/guppytrain/linux.git" "$REPO_DIR"
	else
		echo "$REPO_DIR is a valid repo, fetching into it..."
		git fetch
	fi
else
	echo "$REPO_DIR doesn't exist, clone new repo"
	git clone "https://github.com/guppytrain/linux.git" "$REPO_DIR"

fi

cd "$REPO_DIR/bin"

echo "Starting setup and install..."
#./setup.sh && ./install.sh

