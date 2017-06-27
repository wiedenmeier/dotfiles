#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# history settings
HISTSIZE=1000
HISTFILESIZE=2000

# env vars
export LANG=en_US.UTF-8
export EDITOR="vim"
export TERMINAL="urxvt"
[ -e "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"

# aliases
alias sl='ls --color=auto -F'
alias ls='ls --color=auto -F'
alias ll='ls --color=auto -l -F'
alias la='ls --color=auto -a -F'
alias grep='grep --color=auto'
alias cd..="cd .."
alias got="git"

# prompt
PS1="\[\e[1;35m\]-[\[\e[1;32m\]\h\[\e[1;35m\]]- -[\[\e[1;36m\]\w\[\e[1;35m\]]-\n\[\e[1;35m\]-[\[\e[1;36m\]\@\[\e[1;35m\]]-\[\e[0m\]"
