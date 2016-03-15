ZSH_THEME_NVM_PROMPT_PREFIX="%B⬡%b (node-"
ZSH_THEME_NVM_PROMPT_SUFFIX=")"
ZSH_THEME_RUBY_PROMPT_PREFIX="%B◈%b ("
ZSH_THEME_RUBY_PROMPT_SUFFIX=")"

gvm_prompt_info() {
  if which go >/dev/null; then
    GO_VERSION=$(go version | awk '{print $3}')
    ZSH_THEME_GVM_PROMPT_PREFIX="%B⧂%b ("
    ZSH_THEME_GVM_PROMPT_SUFFIX=")"
    echo "$ZSH_THEME_GVM_PROMPT_PREFIX$GO_VERSION$ZSH_THEME_GVM_PROMPT_SUFFIX"
  else
    echo ''
  fi
}

ruby_prompt_info() {
  RUBY_VERSION="ruby-$(rbenv_prompt_info)"
  echo "$ZSH_THEME_RUBY_PROMPT_PREFIX$RUBY_VERSION$ZSH_THEME_RUBY_PROMPT_SUFFIX"
}

PROMPT=$'%{\e[0;34m%}%B┌─%b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%}$(git-radar --zsh --fetch)
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '
RPROMPT='$(ruby_prompt_info) $(gvm_prompt_info) $(nvm_prompt_info)'
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '
