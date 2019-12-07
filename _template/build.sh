#!/bin/bash
cd "$(dirname "$0")"

if [ "$CI" ]; then
	(umask 0077; echo "$SSH_KEY" > ~/ssh_key; echo "$SSH_KEY_ROLLUP" > ~/ssh_key_rollup; echo "$SSH_KEY_WEBPACK" > ~/ssh_key_webpack)
	git config user.email $EMAIL
	git config user.name '[bot]'
fi

# branch names
ROLLUP=rollup
WEBPACK=webpack

./create-branches.sh $ROLLUP $WEBPACK

git remote set-url origin "https://${ACCESS_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

# force push rollup and webpack branches and repos
git push origin $ROLLUP $WEBPACK -f
