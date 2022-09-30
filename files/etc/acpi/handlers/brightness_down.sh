#!/usr/bin/env bash

set -eo pipefail

# Static increment value
declare -r increment_value=20
declare -r min_value=0

read -r current_value < "/sys/class/backlight/amdgpu_bl0/brightness"

new_value=$((current_value - increment_value))

new_value=$((new_value > min_value ? new_value : min_value))

echo -n "${new_value}" > /sys/class/backlight/amdgpu_bl0/brightness

