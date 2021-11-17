# if installed
if command -v podman &> /dev/null && command -v docker &> /dev/null; then
    alias docker="podman"
fi

if command -v docker &> /dev/null; then
    alias dex="docker exec -it"
    alias drun="docker run -it --entrypoint=/bin/sh"
    alias dk="docker"
    compdef dk=docker
    alias dki="docker images"
fi