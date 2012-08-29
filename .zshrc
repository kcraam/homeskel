# The following lines were added by compinstall

#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' matcher-list '+' '' '' 'r:|[._-]=** r:|=** l:|=*'
#zstyle ':completion:*' menu select=4
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/mcollado/.zshrc'

autoload -Uz compinit
compinit

alias tmux="TERM=xterm-color tmux"
alias ncc='ssh 172.17.200.1'
alias cpd='172.17.200.25'
alias akasha='ssh marck@akasha.11736663.members.btmm.icloud.com'
