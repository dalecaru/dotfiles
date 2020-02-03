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
