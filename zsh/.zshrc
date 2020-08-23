# Path to your oh-my-zsh installation.
export ZSH="/home/yankee/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

plugins=(z git jump zsh-syntax-highlighting zsh-autosuggestions)

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

alias j='jump'
alias m='mark'
alias jn='~/.local/bin/jupyter-notebook --no-browser'

alias install="sudo apt-get install"
alias update="sudo apt-get update"
alias acp="apt-cache policy"
alias acs="apt-cache search"
alias remove="sudo apt-get remove --purge"

alias xo="xdg-open ."
alias rs="redshift -O"
alias rx='redshift -x'

alias ys="yarn start"
alias ybs="yarn build && yarn start"

#Copy current path to the clipboard
alias ccp="pwd | xclip -selection clipboard" 
#export DOCKER_HOST=tcp://localhost:2375

alias py=python3.8
alias va='source venv/bin/activate'
alias vd=deactivate
alias vm='py -m venv venv'
alias vr='rm -rf venv'
alias k='kubectl'
alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""
export NVM_DIR="$HOME/.nvm"

#Lazyload Node.js - NVM and npm
lazynvm() {
  unset -f nvm node npm
    export NVM_DIR=~/.nvm
      [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
        nvm use default
        }
        nvm() {
          lazynvm
            nvm $@
            }

            node() {
              lazynvm
                node $@
                }

                npm() {
                  lazynvm
                    npm $@
                    }


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

