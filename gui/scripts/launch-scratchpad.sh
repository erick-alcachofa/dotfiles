#!/usr/bin/env bash

if  pgrep -f "^$1" >/dev/null; then
    i3-msg "[$2] scratchpad show"
    i3-msg "[$2] move position center"
else
    bash -c "$1 &>/dev/null & disown"

    i3-msg -t subscribe '["window"]'
    i3-msg "[$2] scratchpad show"
    i3-msg "[$2] move position center"
fi
