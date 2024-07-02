CONFIG_DIR="$HOME/Projects/.dotfiles"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshso="source ~/.zshrc"

export PATH="$PATH:$HOME/Projects/cli-scripts"

# ALIASES
alias ls='lsd -a'
alias yd='yarn dev'
alias ys='yarn start'
alias c='clear'

# JAVA AND FLUTTER PATHS
export JAVA_HOME='/usr/lib/jvm/java-20-openjdk/'
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$PATH:/usr/local/flutter/bin"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

alias -s {py,js,json,ts,tsx}='nvim'

export GOPRIVATE="github.com/optible"

function load_nvm () {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
}

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  poetry
)

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

source "$CONFIG_DIR/z/z.sh"
source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/prashant/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
