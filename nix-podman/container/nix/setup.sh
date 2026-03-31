#!/bin/sh

HOST_NIX_ROOT="/opt/nix"
CONTAINER_RUNNER="runner"
NIX_IMAGE="nix-podman"

if [ ! -d "${HOST_NIX_ROOT}" ]; then
    echo "Aborting: '${HOST_NIX_ROOT}' is not a directory or does not exist." >&2
    exit 1
fi

if [ -z "$(find "${HOST_NIX_ROOT}" -prune -user "$(id -u)" -print 2>/dev/null)" ]; then
    echo "Aborting: You do not own '${HOST_NIX_ROOT}'." >&2
    exit 1
fi

if [ "$(ls -A "${HOST_NIX_ROOT}/nix" 2>/dev/null)" ]; then
    echo "Aborting: '${HOST_NIX_ROOT}/nix' is not empty." >&2
    exit 1
fi

chmod 0750 "${HOST_NIX_ROOT}"
mkdir -p "${HOST_NIX_ROOT}/nix"
mkdir -p "${HOST_NIX_ROOT}/home/${CONTAINER_RUNNER}/shared"
chmod 0755 "${HOST_NIX_ROOT}/nix"
chmod 0750 "${HOST_NIX_ROOT}/home"
chmod 0750 "${HOST_NIX_ROOT}/home/${CONTAINER_RUNNER}"
chmod 2770 "${HOST_NIX_ROOT}/home/${CONTAINER_RUNNER}/shared"
setfacl -d -m "g:$(id -g -n):rwx" "${HOST_NIX_ROOT}/home/${CONTAINER_RUNNER}/shared"

exec podman run --rm \
    --userns=keep-id:uid=1000,gid=1000 \
    -v "${HOST_NIX_ROOT}/nix":/tmp/nix \
    --entrypoint "cp" \
    "$NIX_IMAGE" \
    -a /nix/. /tmp/nix

