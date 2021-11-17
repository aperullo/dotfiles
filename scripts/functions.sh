#!/bin/sh

# Stop on error
set -e

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2
  local skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    local currentSrc="$(readlink $dst)"

    if [ "$currentSrc" == "$src" ]
    then
    skip=true;
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_package () {
    # figure out if we're using apt, pacman, or dnf
    if command -v apt-get &> /dev/null; then
        sudo apt-get install -y $1
    elif command -v pacman &> /dev/null; then
        sudo pacman --noconfirm -S $1
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y $1
    else
        fail "Could not find package manager. Are you sure you're using a Linux distro?"
    fi
    success installed $1
}

dir_exists () {
  return $(test -d "$1")
}

file_exists () {
  return $(test -f "$1")
}