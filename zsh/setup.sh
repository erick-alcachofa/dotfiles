#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -S --needed \
    fd \
    fzf \
    bat \
    git \
    lsd \
    sed \
    tar \
    zsh \
    grep \
    wget \
    yazi \
    which \
    unzip \
    rsync \
    zoxide \
    ripgrep \
    gettext \
    starship \
    readline \
    fastfetch \
    findutils \
    pulsemixer

chsh -s $(which zsh)

ln -f -s $DOTFILES/zsh/config/zshrc ~/.zshrc
ln -f -s $DOTFILES/zsh/config/profile ~/.profile
ln -f -s $DOTFILES/zsh/config/zshenv ~/.zshenv
ln -f -s $DOTFILES/zsh/config/dircolors ~/.dircolors

ln -f -s $DOTFILES/zsh/config/starship/starship.toml $CONFIG/starship.toml

mkdir -p $CONFIG/yazi
ln -f -s $DOTFILES/zsh/config/yazi/theme.toml $CONFIG/yazi/theme.toml
ln -f -s $DOTFILES/zsh/config/yazi/keymaps.toml $CONFIG/yazi/keymaps.toml

mkdir -p $CONFIG/fastfetch
ln -f -s $DOTFILES/zsh/config/fastfetch/config.jsonc $CONFIG/fastfetch/config.jsonc

mkdir -p $HOME/{desktop,downloads,templates,public,documents,media/audios,media/pictures,media/videos}
ln -f -s $DOTFILES/zsh/config/user-dirs.dirs $CONFIG/user-dirs.dirs
