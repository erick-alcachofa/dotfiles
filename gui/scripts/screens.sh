#!/bin/sh

args=""

for monitor in $(xrandr | sed -n 's/^\(.*\)\s\+connected.*$/\1/p'); do
    case $monitor in
        HDMI-A-0)
            args="$args --output $monitor --mode 1920x1080 --rotate normal --rate 120.0 --pos 1920x0"
            ;;
        DisplayPort-0)
            args="$args --output $monitor --mode 1920x1080 --rotate normal --rate 120.0 --pos -1920x0"
            ;;
        DisplayPort-2)
            args="$args --output $monitor --mode 1920x1080 --rotate normal --rate 120.0 --pos 0x0 --primary"
            ;; esac
done

if [[ ! -z "$args" ]]; then
    xrandr $args
fi
