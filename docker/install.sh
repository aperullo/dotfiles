#!/bin/sh

set -e

source $FUNCTIONS_LIB

read -p "Install podman? (y/n): " answer

if [  "$answer" = "y" ]; then
    install_package podman
    install_package podman-docker
fi

read -p "Install docker? (y/n): " answer

if [  "$answer" = "y" ]; then
    # TODO: use install_package and just decide
    if command -v pacman &> /dev/null; then
        sudo pacman --noconfirm -S docker
    elif command -v dnf &> /dev/null; then
        sudo dnf -y install dnf-plugins-core
        sudo dnf config-manager \
            --add-repo \
            https://download.docker.com/linux/fedora/docker-ce.repo
        sudo dnf install docker-ce docker-ce-cli containerd.io
    else
        fail "Could not find package manager. Are you sure you're using a Linux distro?"
    fi
    sudo systemctl start docker
    sudo usermod -aG docker $USER
    success "Docker installed"
    info "Log out/in to get docker group"
fi