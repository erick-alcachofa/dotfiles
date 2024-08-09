#!/usr/bin/env bash

printf "%3d%%" $(amdgpu_top -d -J | jq '.[0].gpu_activity.GFX.value')
