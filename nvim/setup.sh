#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -Syu

yay -S --needed neovim xclip

if [ -d "$CONFIG/nvim" ]; then
    rm -fr $CONFIG/nvim
fi

if [ -d $CONFIG/nvim ]; then
    rm $CONFIG/nvim
fi

ln -f -s $DOTFILES/nvim/config $CONFIG/nvim
