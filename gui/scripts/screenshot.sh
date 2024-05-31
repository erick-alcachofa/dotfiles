#!/usr/bin/env bash

sleep 0.2
scrot -f $1 -e 'mv $f ~/media/pictures/screenshots'
