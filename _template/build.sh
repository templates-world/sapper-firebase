#!/bin/bash
cd "$(dirname "$0")"

git config user.email $EMAIL
git config user.name '[bot]'

# branch names
ROLLUP=rollup
WEBPACK=webpack

./create-branches.sh $ROLLUP $WEBPACK

git remote set-url origin "https://${ACCESS_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

# force push rollup and webpack branches and repos
git push origin $ROLLUP $WEBPACK -f
