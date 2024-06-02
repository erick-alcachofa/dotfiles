#!/usr/bin/env bash

i3match=$1

i3-msg -m -t subscribe '["window"]' \
    | jq 'if .change == "new" and .container.window_properties.class == "'$i3match'" then true else false end'
