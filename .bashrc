# ~/.bashrc

# not running interactively then bail
[[ $- != *i* ]] && return

# shell opts
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s histappend
shopt -s expand_aliases

# colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#set VIM as default editor
export EDITOR=vim

# prompt
PS1='\u@\h \W \$ '

# alias
alias backup='rm pkglist.txt && sudo pacman -Qe >> pkglist.txt'
alias q='exit'
alias anaconda_act='source /opt/anaconda/bin/activate root'
alias anaconda_deact='source /opt/anaconda/bin/deactivate root'
alias remove='sudo pacman -Rs'
alias bye='shutdown now'
alias clean='sudo pacman -Rs $( pacman -Qdtq )'
alias l='ls'
alias la='ls -A'
alias ll='ls -lA'
alias ls='ls --color=auto'
alias upd='sudo pacman -Syyu'
alias pac='sudo pacman --color auto'
alias merge='xrdb -merge ~/.Xresources'
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirrors='sudo reflector --score 100 --fastest 25 \
    --sort rate --save /etc/pacman.d/mirrorlist --verbose'

. /usr/share/autojump/autojump.bash

eval $(thefuck --alias)

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias config='/usr/bin/git --git-dir=/home/aggelos/.cfg/ --work-tree=/home/aggelos' 
