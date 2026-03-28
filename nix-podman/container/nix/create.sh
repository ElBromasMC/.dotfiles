#!/bin/sh

HOST_SHARED_DIR="/opt/nix"
CONTAINER_BASE_DIR="/home/runner"
NIX_SERVICE="nix-service"
NIX_VOLUME="nix-store"
NIX_IMAGE="nix-podman"

exec podman create -d \
    --name "$NIX_SERVICE" \
    --privileged \
    --userns=keep-id:uid=1000,gid=1000 \
    -v "$NIX_VOLUME":/nix \
    -v "$HOST_SHARED_DIR":"$CONTAINER_BASE_DIR" \
    "$NIX_IMAGE"

