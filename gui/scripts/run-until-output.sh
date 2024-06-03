#!/usr/bin/env bash

match=$1

shift

bash -c 'echo "$$"; exec stdbuf -oL "$0" "$@"' $@ | (
    read -r pid &&
    sed "/$match/q" &&
    kill -s PIPE "$pid"
)
