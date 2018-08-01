#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# history settings
HISTSIZE=1000
HISTFILESIZE=2000

COMPLETION_PATH="/usr/share/bash-completion/bash_completion"
[ -f $COMPLETION_PATH ] && . $COMPLETION_PATH

# env vars
export LANG=en_US.UTF-8
export EDITOR="vim"
export TERMINAL="rxvt-unicode-256color"
export TERM="rxvt-unicode-256color"
[ -e "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -e "$HOME/Downloads/jdk/bin" ] &&
    export PATH="$PATH:$HOME/Downloads/jdk/bin"

# secret aliases
[ -e "$HOME/.bash-secret-env" ] && . "$HOME/.bash-secret-env"

# aliases
alias sl='ls --color=auto -F'
alias ls='ls --color=auto -F'
alias ll='ls --color=auto -l -F'
alias la='ls --color=auto -a -F'
alias grep='grep --color=auto'
alias cd..="cd .."
alias got="git"
alias watch="watch -c"
alias maek="make"
alias gradle="./gradlew --no-daemon --info"
alias jq="jq -C"
alias less="less -R"

# prompt
PS1="\[\e[1;35m\]-[\[\e[1;32m\]\h\[\e[1;35m\]]- -[\[\e[1;36m\]\w\[\e[1;35m\]]-\n\[\e[1;35m\]-[\[\e[1;36m\]\@\[\e[1;35m\]]-\[\e[0m\]"
