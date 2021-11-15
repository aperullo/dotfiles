#!/bin/sh

# Stop on error
set -e

sudo pacman --noconfirm -S zsh

FILE=$HOME/.oh-my-zsh/oh-my-zsh.sh
if [ ! -f "$FILE" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# zsh-autosuggestions
FILE=$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/README.md
if [ ! -f "$FILE" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

sudo pacman --noconfirm -S the_silver_searcher

cp $HOME/dev/git/dotfiles/home/.zshrc $HOME/.zshrc
