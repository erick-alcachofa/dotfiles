#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -Syu

yay -S --needed rofi

mkdir -p $CONFIG/rofi

for f in $DOTFILES/gui/rofi/config/*.rasi; do
    ln -f -s $f "$CONFIG/rofi/$(basename $f)"
done
