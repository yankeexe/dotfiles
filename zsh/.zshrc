# Path to your oh-my-zsh installation.
export ZSH="/home/yankee/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="intheloop"

plugins=(z git jump zsh-syntax-highlighting zsh-autosuggestions)

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

alias j='jump'
alias m='mark'
alias jn='~/.local/bin/jupyter-notebook --no-browser'

alias lg="lazygit"

# Linux
alias xo="xdg-open ."
alias rs="redshift -O"
alias rx='redshift -x'
alias install="sudo apt-get install"
alias update="sudo apt-get update"
alias acp="apt-cache policy"
alias acs="apt-cache search"
alias remove="sudo apt-get remove --purge"
#Copy current path to the clipboard
alias ccp="pwd | xclip -selection clipboard" 

alias ys="yarn start"
alias ybs="yarn build && yarn start"

alias gweb="gh repo view -w"
alias cat="bat --theme base16"

# Python
alias py=python3.11
alias vd=deactivate
alias bpy="bpython"

# Containers
alias k='kubectl'
alias mp="multipass"
alias mk="minikube"
alias tf="terraform"
alias dco="docker-compose"

alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""

alias zr="source ~/.zshrc"
alias c="code"

export NVM_DIR="$HOME/.nvm"
export PYTHONDONTWRITEBYTECODE=1


# FUNCTION ALIASES
kapply(){
	kubectl apply -f $1 -n $2
}

# Run exec for a running container
de(){
  docker exec -it $1 bash
}

# grep docker image
dg() {
  docker images | grep $1
}

# Stop and remove docker container
drm(){
  docker stop $1 && docker rm $1
}

# Go binary builder
gbin(){
	CGO_ENABLED=0 GOOS=$1 GOARCH=$2 go build -ldflags "-s -w" -a -installsuffix cgo -o bin/$3
}

# Restart multipass daemon
function rmp() {
  sudo launchctl unload /Library/LaunchDaemons/com.canonical.multipassd.plist
  sudo launchctl load /Library/LaunchDaemons/com.canonical.multipassd.plist
}

# Get my IP
function get-ip(){
  curl ipv4.icanhazip.com
}

# Cheatsheet for latencies
function lat() {
  curl cheat.sh/latencies
}

# 🐍 PYTHON-specific

# Create virtual env with set python version and base directory name
# Usage: vm 8 for python 3.8 or vim 12 for python 3.12
# Default version is 3.11
vm() {
  base_name=$(basename "$PWD")
  python3.${1:-11} -m venv ~/.venvs/"$base_name"
}

# Activate virtualenv based on the project directory name
va() {
  base_name=$(basename "$PWD")
  source ~/.venvs/"$base_name"/bin/activate
}

# Delete virtualenv based on the project directory name
vrm(){
    base_name=$(basename "$PWD")
    path="~/.venvs/$base_name"
    rm -rf "$path"
    echo "Deleted $path"
}

# GLOBAL ALIASES
alias -g L="| less"
alias -g J="| jq"
alias -g H="--help"


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

## Configuration for the `less` command
# N -> show line numbers
# i -> disable case sensitivity on search
export LESS="-Ni" 

# Use neovim for opening man pages 
export MANPAGER='nvim +Man!'

export PYTHONDONTWRITEBYTECODE=1
export EDITOR=nvim
export BUILDKIT_PROGRESS=plain
export AWS_PAGER=""
