#!/bin/bash

for name in *; do
  target="$HOME/.$name"
  # Skip this file
  if [ "$name" != 'install.sh' ]; then
    # If file exist and is not a symbolic link, rename it.
    if [ -f "$target" ] && [ ! -L "$target" ]; then
      mv "$target" "$target.bkp"
    fi
    # Create dotfile symbolic link in home directory.
    ln -sf "$PWD/$name" "$target"
  fi
done

install_zsh () {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone oh-my-zsh repo from GitHub only if it isn't already present
    if [ ! -d $HOME/.oh-my-zsh ]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [ "$SHELL" != "$(which zsh)" ]; then
        chsh -s $(which zsh)
    fi
  else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
  fi
}

install_zsh
