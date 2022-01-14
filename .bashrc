#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'

## installation
bin=$HOME/bin
# cd $bin
# curl -O https://raw.githubusercontent.com/rupa/z/master/z.sh
# curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
# curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

## z
source $bin/z.sh
z --clean > /dev/null 2>&1 
## Git
source $bin/git-completion.bash
source $bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
## FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

bind-fzf-cd() {
  local key cmd
  key=$1
  cmd=$2
  bind -m emacs-standard "\"$key\": \" \C-b\C-k \C-u \`$cmd\`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d\""
}
fzf-reverse() {
  cat - | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m 
}
__fzf_cd_z__() {
  local dir
  dir=$(z -l | awk '{ print $2 }' | fzf-reverse) && printf 'cd %q' "$dir"
}
bind-fzf-cd '\ez' '__fzf_cd_z__'

ancestors() {
  path=${1:-$(pwd)}
  init=$(echo $path | sed -E 's!(.*)/.*!\1!')
  [ -z $init ] && echo '/' || {
    echo $init
    ancestors $init
  }
}
__fzf_cd_ancestors__() {
  local dir
  dir=$(ancestors | fzf-reverse) && printf 'cd %q' "$dir"
}
bind-fzf-cd '\eh' '__fzf_cd_ancestors__'

