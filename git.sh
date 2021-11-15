#!/bin/sh

# Stop on error
set -e

# Set up git and ssh
# git comes mostly preinstalled on distros these days.
mkdir ~/.ssh
ssh-keygen -t ed25519 -C "git" -f ~/.ssh/gitkey
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/gitkey

echo "Please add the following public key to github"
cat ~/.ssh/gitkey.pub
read -n 1 -p "[y] to continue" tmp

mkdir -p ~/dev/git
git clone git@github.com:aperullo/dotfiles.git