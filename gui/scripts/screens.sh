#!/bin/sh

nmons="$(xrandr | sed -n '/^.*\s\+connected.*$/p' | wc -l)"

if [ "$nmons" -eq "2" ]; then
    xrandr --output DVI-D-0 --off --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-0 --off --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
fi
