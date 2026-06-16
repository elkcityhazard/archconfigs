#!/usr/bin/env sh

checkupdate_exists=$(which checkupdates | wc -l)
update_count=$(checkupdates | wc -l)
output=""
if [ $checkupdate_exists -eq 0 ]; then
  sudo pacman -S pacman-contrib --noconfirm
fi

if [ $update_count -gt 0 ]; then
  output=$(echo "󰭽 $update_count")
else
  output=$(echo -e "")
fi

printf "%s" "$output"
