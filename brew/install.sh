#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/ant/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
