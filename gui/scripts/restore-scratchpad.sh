#!/usr/bin/env bash

raw_output=$(echo $(i3-msg -t get_tree | jq '[.nodes[] | select(.name == "__i3") | .nodes[].nodes[] | select(.name == "__i3_scratch") | .floating_nodes[].nodes[] | pick(.window_properties.title, .window_properties.class, .id, .window) | "\(.window)\\\\\(.window_properties.title)\\0icon\\x1f\(.window_properties.class)"] | join("\\n")' | tr -d '"'))

output=$(echo -e "$raw_output")

rows=$(printf "%s" "$(echo -e $output | tr '\0' '\377')")

IFS=$'\n' read -rd '' -a entries <<< "$rows"

selected=$(
for line in "${entries[@]}"; do
    echo "$line" | cut -d '\' -f 2 | tr '\377' '\0'
done \
    | rofi \
        -sync\
        -dmenu\
        -format i\
        -no-custom\
        -p "󰍉"\
        -theme ~/.config/rofi/scratchpad.rasi
)

if [ $? -eq  0 ]; then
    window_id=$(echo "${entries[$selected]}" | cut -d '\' -f 1)

    i3-msg "[id=$window_id] scratchpad show, floating toggle"
fi
