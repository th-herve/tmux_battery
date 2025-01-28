#!/usr/bin/env bash

# usage:
# add it in one of tmux status option by referencing the file, example:
# set-option -g status-right '#($HOME/.config/tmux_battery.sh)'

level=$(cat /sys/class/power_supply/BAT1/capacity)
status=$(cat /sys/class/power_supply/BAT1/status)

icon=""

if [[ $status == "Charging" ]]; then
	icon=#[fg=yellow]
elif [[ $level -ge 95 ]]; then
 icon=󰁹

elif [[ $level -ge 90 ]]; then
 icon=󰂁

elif [[ $level -ge 80 ]]; then
 icon=󰂁

elif [[ $level -ge 70 ]]; then
 icon=󰂀

elif [[ $level -ge 60 ]]; then
 icon=󰁿

elif [[ $level -ge 50 ]]; then
 icon=󰁾
 
elif [[ $level -ge 40 ]]; then
 icon=󰁽

elif [[ $level -ge 30 ]]; then
 icon=󰁼

elif [[ $level -ge 20 ]]; then
 icon=#[fg=red]󰁻

else
 icon=#[fg=red]󰁺

fi

echo $icon" "#[fg=white]$level%
