#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -Syu

yay -S --needed tmux tmuxinator

if [ -d "$CONFIG/tmux" ]; then
    rm -fr $CONFIG/tmux
fi

mkdir -p $CONFIG/tmux/plugins

git clone https://github.com/tmux-plugins/tpm $CONFIG/tmux/plugins/tpm

ln -f -s $DOTFILES/tmux/config/tmux.conf $CONFIG/tmux/tmux.conf
ln -f -s $DOTFILES/tmux/config/tmuxinator $CONFIG/tmuxinator
