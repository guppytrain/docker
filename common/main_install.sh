# MAIN INSTALL

echo "Starting Main Image Install..." 

export DEV_DIR="$HOME/dev"

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
cd $PLANTER_DIR \
&& ./plant.sh -d \
&& cd $DEV_DIR/linux/bin \
&& ./setup.sh -n \
&& ./base_install.sh \
&& cd $DEV_DIR/linux/bin/installers \
&& ./vim_plugins_install.sh \
&& echo "Finished Main Image Install"
