#!/bin/sh

# Git
alias gs="git status"
alias gb="git branch"
alias gba="git branch -a"
alias gf="git fetch"

source ~/dotfiles/git-completion.bash
source ~/dotfiles/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ \ncmd >'
