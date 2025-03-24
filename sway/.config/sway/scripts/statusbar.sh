#!/bin/sh

#
# Query basic system information
#

# Date and time
date_time="$(date +'%Y-%m-%d %X')"

# Volume (wireplumber)
audio_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

# Keyboard
language=$(swaymsg -r -t get_inputs | jq -r 'first(.[] | select(.type == "keyboard") | .xkb_active_layout_name | select(. != null or . == ""))')

echo "${language} | ${audio_volume} | ${date_time}"

