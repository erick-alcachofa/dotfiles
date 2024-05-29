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

if [ ! -x "$(command -v yay)" ]; then
    . $DOTFILES/yay.sh
fi

yay -Syu

yay -S --needed \
    xorg \
    xorg-xinit \

. $DOTFILES/gui/i3/setup.sh 
. $DOTFILES/gui/picom/setup.sh 
. $DOTFILES/gui/dunst/setup.sh 
. $DOTFILES/gui/polybar/setup.sh 
. $DOTFILES/gui/rofi/setup.sh 
. $DOTFILES/gui/wezterm/setup.sh 

yay -S --needed \
    obs-studio \
    vlc \
    ufw \
    flac \
    gimp \
    opus \
    gpick \
    qimgv \
    arandr \
    scrcpy \
    thunar \
    ffmpeg \
    jmtpfs \
    xdotool \
    vivaldi \
    firefox \
    spotify \
    discord \
    remmina \
    xreader \
    ntfs-3g \
    texinfo \
    udiskie \
    chromium \
    seahorse \
    guvcview \
    qpwgraph \
    opusfile \
    pipewire \
    screenkey \
    xarchiver \
    djvulibre \
    ufw-extras \
    libspectre \
    pavucontrol \
    wireplumber \
    texlive-bin \
    extfat-utils \
    pipewire-alsa \
    pipewire-jack \
    pipewire-pulse \
    squashfs-tools \
    transmission-qt \
    telegram-desktop \
    otf-latin-modern \
    ffmpegthumbnailer

