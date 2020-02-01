source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh
antigen theme pure

antigen bundles <<EOBUNDLES
  bower
  bundler
  colored-man-pages
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
# uuid
alias uuid="uuidgen | tr -d - | tr -d '\n' | tr '[:upper:]' '[:lower:]'  | pbcopy && pbpaste && echo"

# Autocd
setopt autocd

# Auto Correct
unsetopt correct_all

# Auto name dirs
unsetopt auto_name_dirs

# Hook direnv
eval "$(direnv hook zsh)"
