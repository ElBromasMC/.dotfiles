#!/bin/sh

HOST_NIX_ROOT="/opt/nix"
CONTAINER_RUNNER="runner"
NIX_SERVICE="nix-service"
NIX_IMAGE="nix-podman"

exec podman create \
    --name "$NIX_SERVICE" \
    --privileged \
    --userns=keep-id:uid=1000,gid=1000 \
    -v "${HOST_NIX_ROOT}/nix":/nix \
    -v "${HOST_NIX_ROOT}/home/${CONTAINER_RUNNER}":"/home/${CONTAINER_RUNNER}" \
    "$NIX_IMAGE"

