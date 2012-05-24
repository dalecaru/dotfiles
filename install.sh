#!/bin/sh
for name in *; do
  target="$HOME/.$name"
  if [ "$name" != 'install.sh' ]; then
    if [ -e "$target" ]; then
      mv "$target" "$target.bkp"
    fi
    ln -sf "$PWD/$name" "$target"
  fi
done
