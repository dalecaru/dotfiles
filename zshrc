# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Set VIM as default editor
export EDITOR=vim

# Aliases
# ZSH
alias zshrc="vim ~/.zshrc"
alias zshsrc="source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# ZMV
autoload -U zmv
alias zmz='noglob zmv'
alias zcp='noglob zmv -C'

# Git
alias glogf="git log --graph --color"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Autostart Tmux
ZSH_TMUX_AUTOSTART=false

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bower bundler colored-man docker git jsontools node npm nvm rvm ssh-agent sublime tmux urltools vagrant)

source $ZSH/oh-my-zsh.sh

# Autocd
setopt autocd

# Customize to your needs...
ANDROID_HOME=$HOME/Dev/android-sdk-linux
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools # Add Android tools to PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
JRUBY_OPTS="-Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF" # jruby dev

# Alias
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"