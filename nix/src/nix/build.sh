#!/bin/sh

NIX_IMAGE="podman-nix"

tar -ch . | podman build -t "$NIX_IMAGE" -

