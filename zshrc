source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh
antigen theme gallois

antigen bundles <<EOBUNDLES
  bower
  bundler
  colored-man
  command-not-found
  docker
  git
  git-extras
  jsontools
  node
  npm
  nvm
  rbenv
  safe-paste
  ssh-agent
  sublime
  tmux
  urltools
  vagrant
  sharat87/autoenv
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply

# Aliases
# ZMV
autoload -U zmv
alias zmz='noglob zmv'
alias zcp='noglob zmv -C'

# Autocd
setopt autocd

# Auto Correct
unsetopt correct_all

# Auto name dirs
unsetopt auto_name_dirs
