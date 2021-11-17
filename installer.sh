#!/bin/sh

# Stop on error
set -e

export DOTFILES_ROOT=$HOME/dev/git/dotfiles

# imports
export FUNCTIONS_LIB=$DOTFILES_ROOT/scripts/functions.sh
source $FUNCTIONS_LIB

for f in $DOTFILES_ROOT/**/install.sh; do
    $f
done

# put the aliases in oh-my-zsh custom folder so they autoload
for f in $DOTFILES_ROOT/**/aliases.zsh; do
    dir=$(dirname $f)
    dir=$(basename $dir)
    name=$(basename $f)
    
    # link vscode/aliases.sh to vscode-aliases.sh
    link_file $f $HOME/.oh-my-zsh/custom/$dir-$name
done