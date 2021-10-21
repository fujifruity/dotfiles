#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'


## installation
bin=~/bin
# cd $bin
# curl -O https://raw.githubusercontent.com/rupa/z/master/z.sh
# curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
# curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

## z
source $bin/z.sh
## Git
source $bin/git-completion.bash
source $bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
## FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# PS1='[\u@\h \W]\$ '
__prompt_command() {
    local curr_exit="$?"
    local BRed='\[\e[0;91m\]'
    local RCol='\[\e[0m\]'
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\n'
    if [ "$curr_exit" != 0 ]; then
        PS1=$PS1"${BRed}[$curr_exit]${RCol}"
    fi
    PS1="$PS1\$ "
}
PROMPT_COMMAND=__prompt_command
