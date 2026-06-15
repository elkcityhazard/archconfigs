#!/usr/bin/env sh
# Purpose: set the wallpaper
# Dependencies: You need to have awww installed and have the awwww-daemon running. Note this is for
# wayland compositors
# Date: 2026-06-13
# Modified: 2026-06-14
path_to_imgs="/home/andrew/Pictures/wallpapers/dist"
image_files=$(find $path_to_imgs -type f)
allowed_files=()
count=0
awww_exists=$(which awww | wc -l)
transition_duration=1.5
if [ "$awww_exists" -eq "0"  ]; then
  echo "You need to install awww and make sure awww-daemon is running"
fi

if ! pgrep -x "awww-daemon" > /dev/null; then
  echo "awww-daemon is not running. Starting it now..."
  awww-daemon &
  sleep 5
else
  echo "awww-daemon is already running."
fi
for file in $image_files; do
  mime=$(file --mime-type -b "$file")
  if echo "$mime" | grep -q "^image/"; then
    allowed_files+=("$file")
    count=$((count + 1))
  fi
done

if [ -z "$image_files" ]; then
  echo "No images found in ${path_to_imgs}"
  exit 1
fi
while true; do
  random_image=$(printf "%s\n" "${allowed_files[@]}" | shuf -n 1)
  echo "Setting wallpaper to: ${random_image}"
  awww img $random_image --transition-type random --transition-duration "$transition_duration"
  sleep 180
done
