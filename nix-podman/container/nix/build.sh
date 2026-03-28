#!/bin/sh

NIX_IMAGE="nix-podman"

tar -ch . | podman build -t "$NIX_IMAGE" -

