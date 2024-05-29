#!/usr/bin/env bash

data=$(nvidia-smi --query-gpu="memory.total,memory.used" --format="csv,noheader,nounits")

total=$(echo $data | cut -d"," -f1 | tr -d '[:space:]')
used=$(echo $data | cut -d"," -f2 | tr -d '[:space:]')
percentage=$(awk -vu=$used -vt=$total 'BEGIN{printf "%3.0f", u/t*100.0 }')

echo "$used MiB ($percentage%)"
