#!/bin/sh

# Stop on error
set -e

# Set up git and ssh
# git comes mostly preinstalled on distros these days.
mkdir -p ~/.ssh

FILE=$HOME/.ssh/gitkey
if [ ! -f "$FILE" ]; then
    ssh-keygen -t ed25519 -C "git" -f ~/.ssh/gitkey
fi

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/gitkey

echo "Please add the following public key to github:"
cat ~/.ssh/gitkey.pub
read -n 1 -p "any key to continue" tmp

# bootstrap the repo
mkdir -p ~/dev/git
git clone git@github.com:aperullo/dotfiles.git ~/dev/git/dotfiles

# cp $HOME/dev/git/dotfiles/home/.gitconfig $HOME/.gitconfig