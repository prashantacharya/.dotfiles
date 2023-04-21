export ZSH="/home/prashant/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-z)

source $ZSH/oh-my-zsh.sh

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
# export JAVA_HOME='/usr/lib/jvm/java-19-openjdk/'
# export PATH=$JAVA_HOME/bin:$PATH
# export PATH="$PATH:/usr/bin/flutter/bin"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

alias -s {py,js,json,ts,tsx}='vim'

export GOPRIVATE="github.com/optible"

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
