#!/usr/bin/env bash

DISPLAY_CONFIG=$(
    i3-msg -t get_outputs \
    | jq -r '.[]|"\(.name):\(.current_workspace)"' \
    | grep -E "(DisplayPort-2|HDMI-A-0)"
)

DISPLAYS_COUNT=$(echo "$DISPLAY_CONFIG" | wc -l)

FOCUSED=$(i3-msg -t get_workspaces | jq -r 'map(select(.focused)) | .[] | "\(.output)"')

echo $DISPLAYS_COUNT

if [[ $DISPLAYS_COUNT -eq "2" ]]; then
    WORKSPACE_HDMI=$(echo "$DISPLAY_CONFIG" | grep "HDMI-A-0" | cut -d':' -f2)
    WORKSPACE_DSPL=$(echo "$DISPLAY_CONFIG" | grep "DisplayPort-2" | cut -d':' -f2)

    echo $WORKSPACE_HDMI $WORKSPACE_DSPL

    i3-msg workspace "$WORKSPACE_HDMI"
    i3-msg move workspace to output DisplayPort-2

    sleep 0.04

    i3-msg workspace "$WORKSPACE_DSPL"
    i3-msg move workspace to output HDMI-A-0

    sleep 0.04

    echo $FOCUSED

    i3-msg focus output $FOCUSED
fi
