#!/bin/sh

# Stop on error
set -e

source $FUNCTIONS_LIB

install_package zsh

if ! dir_exists $HOME/.oh-my-zsh; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# zsh-autosuggestions
DIR=$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
if ! dir_exists "$DIR" ; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

link_file $DOTFILES_ROOT/zsh/.zshrc $HOME/.zshrc