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

# Battery (if present)
battery_info=""
if [ -d /sys/class/power_supply/BAT0 ]; then
    battery_pct=$(cat /sys/class/power_supply/BAT0/capacity)
    battery_status=$(cat /sys/class/power_supply/BAT0/status)
    battery_info=" | ${battery_pct}% ${battery_status}"
fi

# CPU temperature (if present)
cpu_temp=""
if [ -d /sys/class/thermal/thermal_zone0 ]; then
    temp=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
    if [ -n "$temp" ]; then
        cpu_temp=" | CPU: $(($temp / 1000))°C"
    fi
fi

echo "${language} | ${audio_volume}${battery_info}${cpu_temp} | ${date_time}"

