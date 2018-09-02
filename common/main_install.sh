# MAIN INSTALL

echo "Starting Main Install..." 

# get planter
export PLANTER_REPO="https://github.com/guppytrain/planter.git" 
export PLANTER_DIR="$HOME/dev/planter" 

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
$PLANTER_DIR/plant.sh \
&& export DEV_DIR="$HOME/dev" \
&& cd $DEV_DIR/linux/bin/util \
&& ./duso.sh \
&& cd $DEV_DIR/linux/bin \
&& ./setup.sh -n \
&& ./base_install.sh \
&& cd $DEV_DIR/linux/bin/installers \
&& ./vim_plugins_install.sh \
&& echo "Finished Main Install"
