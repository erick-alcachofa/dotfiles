#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -Syu

yay -S --needed ttf-cascadia-mono-nerd \
    ttf-cascadia-code-nerd \
    ttf-fantasque-nerd \
    ttf-iosevka-nerd \
    ttf-jetbrains-mono-nerd \
    ttf-monofur-nerd \
    ttf-mononoki-nerd \
    ttf-ubuntu-mono-nerd \
    ttf-ubuntu-nerd \
    ttf-icomoon-feather \
    noto-fonts \
    noto-fonts-cjk \
    ttf-font-awesome \
    ttf-joypixels \
    ttf-liberation

yay -S --needed i3 i3lock-color lightdm lightdm-slick-greeter

sudo systemctl enable lightdm

sudo sed -i 's/^\(#\s*\)\?\(greeter-session=\).*$/\2lightdm-slick-greeter/' /etc/lightdm/lightdm.conf
sudo ln -f -s $DOTFILES/gui/i3/config/greeter.conf /etc/lightdm/slick-greeter.conf

yay -S --needed dex feh warpd scrot

mkdir -p $CONFIG/i3

ln -f -s $DOTFILES/gui/i3/config/config "$CONFIG/i3/config"

yay -S --needed rose-pine-gtk-theme-full
yay -S --needed qt5gtk2 qt6gtk2
yay -S --needed qt5ct qt6ct

ln -f -s $DOTFILES/gui/i3/config/gtk/gtkrc-2.0 $HOME/.gtkrc-2.0

mkdir -p $CONFIG/gtk-3.0
ln -f -s $DOTFILES/gui/i3/config/gtk/gtk-3.0/settings.ini $CONFIG/gtk-3.0/settings.ini

mkdir -p $CONFIG/qt5ct
mkdir -p $CONFIG/qt6ct

ln -f -s $DOTFILES/gui/i3/config/qt/qt5ct.conf $CONFIG/qt5ct/qt5ct.conf
ln -f -s $DOTFILES/gui/i3/config/qt/qt6ct.conf $CONFIG/qt6ct/qt6ct.conf

mkdir -p $CONFIG/xfce4
cp -s $DOTFILES/i3/config/xfce4/helpers.rc $CONFIG/xfce4/helpers.rc
