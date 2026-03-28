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

Create a shared directory (for example `/opt/nix`) and give your user access to
it.

```bash
# mkdir /opt/nix
# chown nix:nix /opt/nix
# chmod 2770 /opt/nix
# usermod -aG nix <your_user>
```

Enable a user service to manage the start and stop of the nix service.

To run nix commands from your user define `NIX_USER=nix` as environment
variable.

