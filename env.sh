#!/usr/bin/env

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
fi

export CONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}"
export ARTI_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/arti"
