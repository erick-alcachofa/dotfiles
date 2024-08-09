#!/bin/sh

nmons="$(xrandr | sed -n '/^.*\s\+connected.*$/p' | wc -l)"

if [ "$nmons" -eq "2" ]; then
    xrandr --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate normal --rate 120.0 --output DisplayPort-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --rate 120.0
fi
