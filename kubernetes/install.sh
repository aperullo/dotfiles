#!/bin/sh

# Stop on error
set -e

source $FUNCTIONS_LIB

/home/linuxbrew/.linuxbrew/bin/brew install kubectl
/home/linuxbrew/.linuxbrew/bin/brew install helm