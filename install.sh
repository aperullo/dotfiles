#!/bin/sh

# Stop on error
set -e

./flatpak.sh
./git.sh
./zsh.sh
