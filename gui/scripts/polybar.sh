#!/usr/bin/env bash

polybar-msg cmd quit

while pgrep -u $UID -x polybar >/dev/null; do
    sleep 1
done

polybar -q top 2>&1 | tee /tmp/polybar_top.log & disown 
polybar -q bot 2>&1 | tee /tmp/polybar_bot.log & disown 
