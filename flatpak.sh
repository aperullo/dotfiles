#!/bin/sh

# Stop on error
set -e

# install commonly used apps in a way that works on any distro. 
pacman -S flatpak
flatpak install flathub com.visualstudio.code
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.discordapp.Discord
flatpak install flathub org.chromium.Chromium
