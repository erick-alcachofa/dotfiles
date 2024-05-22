#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -Syu

yay -S --needed dunst

mkdir -p $CONFIG/dunst

ln -f -s $DOTFILES/gui/dunst/config/dunstrc "$CONFIG/dunst/dunstrc"
