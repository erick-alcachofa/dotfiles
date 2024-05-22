#!/usr/bin/env bash

if pgrep -x -f 'bash.*picom/launch.*' | grep -v $$ >/dev/null; then
    kill -9 `pgrep -x -f 'bash.*picom/launch.*' | grep -v $$`
fi

while pgrep -u $UID -x -f 'bash.*picom/launch.*' | grep -v $$ >/dev/null; do
    sleep 1
done

while true; do
    if pgrep -x "picom" >/dev/null; then
        pkill picom
    fi

    while pgrep -u $UID -x picom >/dev/null; do
        sleep 1
    done

    picom --log-level info --config ~/.config/picom/picom.conf 2>&1 | tee -a /tmp/picom.log
    notify-send -u critical -t 2500 "Picom died, running loop again"
done
