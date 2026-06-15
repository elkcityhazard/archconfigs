#!/usr/bin/env bash
echo 50 | tee -a /sys/class/power_supply/BAT0/charge_control_start_threshold
echo 80 | tee -a /sys/class/power_supply/BAT0/charge_control_end_threshold
