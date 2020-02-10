export ZSH=/Users/aldis/.oh-my-zsh

plugins=(git colored-man colorize github jira virtualenv pip python osx zsh-syntax-highlighting docker yarn)
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

alias pybot='pybot -d report'

export HISTFILE=~/.zsh_history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export LANG=C

export EDITOR='nvim'
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export PATH=$PATH:$HOME/Documents/flutter/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source $HOME/.cargo/env
