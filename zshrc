source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh
antigen theme $HOME .duellj

antigen bundles <<EOBUNDLES
  bower
  bundler
  colored-man
  command-not-found
  docker
  git
  git-extras
  golang
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
  joshuarubin/zsh-gvm
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

# Launch Byobu
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
