#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles

    if [ ! -d "$DOTFILES" ]; then
        if [ ! -x "$(command -v git)" ]; then
            sudo pacman -Syu
            sudo pacman -S --needed git
        fi

        git clone https://github.com/erick-alcachofa/dotfiles $DOTFILES
    fi

    source $DOTFILES/env.sh
fi

. $DOTFILES/yay.sh
. $DOTFILES/git/setup.sh

. $DOTFILES/zsh/setup.sh
. $DOTFILES/tmux/setup.sh
. $DOTFILES/nvim/setup.sh

. $DOTFILES/gui/setup.sh


