#!/usr/bin/env bash
/usr/lib/polkit-kde-authentication-agent-1 &
wl-paste --watch cliphist store &
waybar > /dev/null 2>&1 &
~/.config/scripts/wallpaper.sh > /dev/null 2>&1 &

swayidle -w \
  timeout 180 'swaylock -f -c 000000' \
  timeout 240 'swaymsg "output * power off"' \
  timeout 300 'systemctl hibernate' \
  resume 'swaymsg "output * power on"' \
  before-sleep 'swaylock -f -c 000000'



