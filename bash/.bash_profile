# /etc/skel/.bash_profile

# Source: https://wiki.archlinux.org/title/Environment_variables
set_path(){
    # Check if user id is 1000 or higher
    [ "$(id -u)" -ge 1000 ] || return

    for i in "$@";
    do
        # Check if the directory exists
        [ -d "$i" ] || continue

        # Check if it is not already in your $PATH.
        echo "$PATH" | grep -Eq "(^|:)$i(:|$)" && continue

        # Then append it to $PATH and export it
        export PATH="${PATH}:$i"
    done
}

# Set custom PATH
set_path ~/.local/bin
#set_path ~/go/bin ~/.cargo/bin
#set_path ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin

# Set and create a dumb runtime dir if not defined
if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/"${UID}"-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

export EDITOR=/bin/nvim
export VISUAL=/bin/nvim



#
# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
#
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# Start Sway on tty1
if [ -z "${WAYLAND_DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
    export XDG_CURRENT_DESKTOP=sway
    export ELECTRON_OZONE_PLATFORM_HINT=wayland
    #export WLR_RENDERER=vulkan

    # Define "well known" user directories
    export XDG_PICTURES_DIR="${HOME}/Pictures"
    export XDG_SCREENSHOTS_DIR="${XDG_PICTURES_DIR}/Screenshots"

    exec dbus-run-session sway > ~/sway.log 2>&1
fi

