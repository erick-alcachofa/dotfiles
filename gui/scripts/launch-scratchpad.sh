#!/usr/bin/env bash

match=$1
i3match=$2

start=$3

if [ -z "$start" ]; then
    start=$match
fi

if  pgrep -f "^$match" >/dev/null; then
    i3-msg "[class=\"$i3match\"] scratchpad show"
    i3-msg "[class=\"$i3match\"] move position center"
else
    bash -c "$start &>/dev/null & disown"

    ~/dotfiles/gui/scripts/run-until-output.sh true ~/dotfiles/gui/scripts/window-wait.sh $i3match

    i3-msg "[class=\"$i3match\"] scratchpad show"
    i3-msg "[class=\"$i3match\"] move position center"
fi
