# MAIN INSTALL

# get planter
PLANTER_REPO="https://github.com/guppytrain/planter.git"
PLANTER_DIR="planter"

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

