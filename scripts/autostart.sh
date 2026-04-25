#!/usr/bin/env bash

awww-daemon > /dev/null 2>&1 &
/usr/lib/polkit-kde-authentication-agent-1 > /dev/null 2>&1 &

swayidle -w \
  timeout 180 'swaylock -f' \
  timeout 300 'swaymsg "output * power off"' \
  resume 'swaymsg "output * power on"' \
  before-sleep 'swaylock -f' > /dev/null 2>&1 &

