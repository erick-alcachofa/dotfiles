#!/usr/bin/env bash

data=$(amdgpu_top -d -J | jq '.[0].VRAM | "\(."Total VRAM".value),\(."Total VRAM Usage".value)"' | tr -d "\"")

total=$(echo $data | cut -d"," -f1 | tr -d '[:space:]')
used=$(echo $data | cut -d"," -f2 | tr -d '[:space:]')
percentage=$(awk -vu=$used -vt=$total 'BEGIN{printf "%3.0f", u/t*100.0 }')

echo "$used MiB ($percentage%)"
