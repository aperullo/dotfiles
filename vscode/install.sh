#!/bin/sh

# Stop on error
set -e

# install commonly used apps in a way that works on any distro. 

flatpak install flathub com.visualstudio.code
alias code="flatpak run com.visualstudio.code"

code --install-extension njpwerner.autodocstring
code --install-extension GitHub.copilot
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension VisualStudioExptTeam.vscodeintellicode