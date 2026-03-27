#!/bin/sh

HOST_SHARED_DIR="$HOME/nix"
CONTAINER_BASE_DIR="/home/runner"
NIX_IMAGE="podman-nix"

exec podman run -d \
    --name nix-service \
    --restart=unless-stopped \
    --privileged \
    --userns=keep-id:uid=1000,gid=1000 \
    -v nix-store:/nix \
    -v "$HOST_SHARED_DIR":"$CONTAINER_BASE_DIR" \
    "$NIX_IMAGE"

