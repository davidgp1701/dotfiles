#!/usr/bin/env bash

set -eo pipefail

# Static increment value
declare -r increment_value=20

read -r max_value < "/sys/class/backlight/amdgpu_bl0/max_brightness"
read -r current_value < "/sys/class/backlight/amdgpu_bl0/brightness"

new_value=$((current_value + increment_value))

new_value=$((new_value < max_value ? new_value : max_value))

echo -n "${new_value}" > /sys/class/backlight/amdgpu_bl0/brightness
