#!/bin/bash

bwrap \
--symlink usr/lib /lib \
--symlink usr/bin /bin \
--symlink usr/bin /sbin \
--ro-bind /usr/lib /usr/lib \
--ro-bind /usr/bin /usr/bin \
--ro-bind /etc/ld-musl-aarch64.path /etc/ld-musl-aarch64.path \
--ro-bind /usr/lib/firefox /usr/lib/firefox \
--ro-bind /usr/share/applications /usr/share/applications \
--ro-bind /usr/share/gtk-3.0 /usr/share/gtk-3.0 \
--ro-bind /usr/share/icu /usr/share/icu \
--ro-bind /usr/share/drirc.d /usr/share/drirc.d \
--ro-bind /usr/share/fonts /usr/share/fonts \
--ro-bind /usr/share/glib-2.0 /usr/share/glib-2.0 \
--ro-bind /usr/share/glvnd /usr/share/glvnd \
--ro-bind /usr/share/icons /usr/share/icons \
--ro-bind /usr/share/mime /usr/share/mime \
--ro-bind /usr/share/X11/xkb /usr/share/X11/xkb \
--ro-bind /usr/share/icons /usr/share/icons \
--ro-bind /etc/fonts /etc/fonts \
--ro-bind /etc/resolv.conf /etc/resolv.conf \
--ro-bind /usr/share/ca-certificates /usr/share/ca-certificates \
--ro-bind /etc/ssl /etc/ssl \
--tmpfs /tmp \
--dir "$XDG_RUNTIME_DIR" \
--ro-bind "$XDG_RUNTIME_DIR/pulse" "$XDG_RUNTIME_DIR/pulse" \
--ro-bind "$XDG_RUNTIME_DIR/wayland-1" "$XDG_RUNTIME_DIR/wayland-1" \
--dev /dev \
--dev-bind /dev/dri /dev/dri \
--ro-bind /sys/dev/char /sys/dev/char \
--ro-bind /sys/devices/platform /sys/devices/platform \
--proc /proc \
--bind "/home/${USER}/.mozilla" "/home/${USER}/.mozilla" \
--bind "/home/${USER}/Downloads" "/home/${USER}/Downloads" \
--setenv HOME "/home/${USER}" \
--setenv GTK_THEME Adwaita:dark \
--setenv MOZ_ENABLE_WAYLAND 1 \
--setenv PATH /usr/bin \
--hostname RESTRICTED \
--unshare-all \
--share-net \
--die-with-parent \
--new-session \
/usr/bin/firefox --no-remote

