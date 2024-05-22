#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -Syu

yay -S --needed picom-git

mkdir -p $CONFIG/picom

ln -f -s $DOTFILES/gui/picom/config/picom.conf "$CONFIG/picom/picom.conf"
