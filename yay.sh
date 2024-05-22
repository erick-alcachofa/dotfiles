#!/usr/bin/env bash

sudo pacman -Syu

sudo pacman -S --needed git base-devel

mkdir -p ~/dev/opt

git clone https://aur.archlinux.org/yay.git ~/dev/opt/yay 

cd ~/dev/opt/yay

makepkg -si
