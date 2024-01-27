CONFIG_DIR="$HOME/Projects/.dotfiles"

ZSH_THEME="robbyrussell"
ZSH_PLUGINS="$CONFIG_DIR/zsh-plugins/init.zsh"

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshso="source ~/.zshrc"

eval "$(starship init zsh)"
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

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

source $ZSH_PLUGINS
source "$CONFIG_DIR/z"
