# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Set a custom PATH by modifying the default one. However, keep a
# copy of the default one in order to not keep prefixing it when
# nesting shells etc.
[ -z "$MASTERPATH" ] && export MASTERPATH="$PATH"
export PATH="${HOME}/.local/bin:${HOME}/go/bin:${HOME}/.cargo/bin:/var/lib/flatpak/exports/bin:$MASTERPATH"

# Start Sway on tty1
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	export ELECTRON_OZONE_PLATFORM_HINT=wayland
	export XDG_CURRENT_DESKTOP=sway
	dbus-run-session sway
fi

#export TERM=xterm-256color

alias lc='loginctl'
alias vim='nvim'

