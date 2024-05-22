#!/usr/bin/env bash

DISPLAY_CONFIG=($(i3-msg -t get_outputs | jq -r '.[]|"\(.name):\(.current_workspace)"'))

for ROW in "${DISPLAY_CONFIG[@]}"; do
    SCREEN=$(echo "${ROW}" | cut -d':' -f1)
    WORKSPACE=$(echo "${ROW}" | cut -d':' -f2-)

    if [ "${SCREEN}" != "null" ] && [ "${WORKSPACE}" != "null" ]; then
        i3-msg -- workspace --no-auto-back-and-forth "${WORKSPACE}" &>/dev/null
        i3-msg -- move workspace to output right &>/dev/null
    fi
done
