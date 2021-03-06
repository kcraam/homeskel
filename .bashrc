# ~/.bashrc: executed by bash(1) for non-login shells.
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

# gnome-terminal workaround
if [ "$TERM" == "xterm" ]; then
	# No it isn't, it's gnome-terminal
	export TERM=xterm-256color
fi

# envs.
if [ -z "$BASHRC_ENV_LOADED" ]; then
	export BASHRC_ENV_LOADED=true
	[ -f "$HOME/.bashrc.env" ] && source "$HOME/.bashrc.env"
	[ -f "$HOME/.bashrc.env.local" ] && source "$HOME/.bashrc.env.local"
fi

# handle screen/tmux & ssh
if [ ! -z "`which tmux`" ]; then
	[ -f "$HOME/.bashrc.tmux" ] && source "$HOME/.bashrc.tmux"
else
	[ -f "$HOME/.bashrc.screen" ] && source "$HOME/.bashrc.screen"
fi


# aliases for interactive shell
[ -f "$HOME/.bashrc.alias" ] && source "$HOME/.bashrc.alias"

# Execute local differences
[ -f "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

[ -f "$HOME/MOTD" ]  && cat "$HOME/MOTD"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PS1="\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 1)\]\h\[$(tput sgr0)\]:\[$(tput setaf 4)\]\W\[$(tput sgr0)\]\$ "

set -o vi
