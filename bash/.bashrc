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

detach() {
    "$@" >& /dev/null < /dev/null &
}

# Configure tab completion
# Source: https://wiki.gentoo.org/wiki/Doas#Bash_tab_completion
complete -F _root_command doas

alias vim='nvim'
alias top='htop'
alias ssh='TERM=xterm-256color ssh'

alias poweroff='doas /sbin/poweroff'
alias reboot='doas /sbin/reboot'

