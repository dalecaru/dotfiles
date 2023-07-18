source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh
antigen theme robbyrussell

antigen bundles <<EOBUNDLES
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
  urltools
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

# Override exit()
exit() {
  if [[ -z $TMUX ]]; then
    builtin exit
    return
  fi

  panes=$(tmux list-panes | wc -l)
  wins=$(tmux list-windows | wc -l)
  count=$(($panes + $wins -1))
  if [ $count -eq 1 ]; then
    tmux detach
  else
    builtin exit
  fi
}

# Hook rbenv
eval "$(rbenv init -)"

# Hook cargo
source "$HOME/.cargo/env"

# Hook nvm
[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
