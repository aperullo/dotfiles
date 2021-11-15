#!/bin/sh

# Stop on error
set -e

# install commonly used apps in a way that works on any distro. 
sudo pacman --noconfirm -S flatpak

flatpak install flathub com.visualstudio.code
alias code="flatpak run com.visualstudio.code"

code --install-extension njpwerner.autodocstring
code --install-extension GitHub.copilot
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension VisualStudioExptTeam.vscodeintellicode

flatpak install flathub org.gimp.GIMP
flatpak install flathub com.discordapp.Discord
flatpak install flathub org.chromium.Chromium
