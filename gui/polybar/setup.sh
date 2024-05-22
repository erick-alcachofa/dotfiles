#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -Syu

yay -S --needed python-distutils-extra
yay -S --needed polybar zscroll-git playerctl pactl

mkdir -p $CONFIG/polybar

for f in $DOTFILES/gui/polybar/config/*.ini; do
    ln -f -s $f "$CONFIG/polybar/$(basename $f)"
done
