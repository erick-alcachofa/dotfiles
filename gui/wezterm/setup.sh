#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -Syu

yay -S --needed wezterm

mkdir -p $CONFIG/wezterm

ln -f -s $DOTFILES/gui/wezterm/config/wezterm.lua $CONFIG/wezterm/wezterm.lua
