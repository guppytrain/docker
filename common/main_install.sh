# MAIN INSTALL

# get planter
PLANTER_REPO="https://github.com/guppytrain/planter.git"
PLANTER_DIR="$HOME/dev/planter"

if [ -d "$PLANTER_DIR" ]; then
    cd "$PLANTER_DIR"
	if [ -z "$(git status)" ] && [ -z "$(ls -A ".git")" ]; then
		git clone "$PLANTER_REPO" "$PLANTER_DIR"
	else
        git checkout -f && git pull
	fi
else
	git clone "$PLANTER_REPO" "$PLANTER_DIR"

fi

# do some planting
$PLANTER_DIR/plant.sh

# switch workdir and import env
LINUX_DIR="$HOME/dev/linux"

# change cwd
cd $LINUX_DIR/bin

# \. ./include/env.sh

# strip sudo
./util/duso.sh

# start installing
./setup.sh -n

./base_install.sh

# individual installers
./installers/vim_plugins_install.sh
