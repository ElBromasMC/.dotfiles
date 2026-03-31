# Run nix in a different user

If you use `--privileged` file to start the podman service, it is recommended
to run the service in a diferent user (for example `nix`).

```bash
# useradd -m -s /bin/bash nix
```

Add the following to your `/etc/doas.conf`.

```
permit nopass :nix as nix
```

Setup nix directory.

```bash
# mkdir -p /opt/nix
# chown nix:nix /opt/nix
# usermod -aG nix <your_user>
```

Run `setup.sh` as `nix` user to create the directory structure in `/opt/nix`
and to copy the needed files. Then run `create.sh` to create the container.

Enable a user service to manage the start and stop of the nix container.

To run nix commands from your user define `NIX_USER=nix` as environment
variable.

