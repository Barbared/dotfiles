ZSH=$HOME/.oh-my-zsh

export EDITOR=vim
export PATH=$PATH:$HOME/bin

ZSH_THEME="gurgeh"

plugins=(git rails rails3)

. $ZSH/oh-my-zsh.sh
unsetopt correct_all

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

. ~/dotfiles/functions.sh
. ~/dotfiles/aliases.sh
. ~/dotfiles/otb.sh
