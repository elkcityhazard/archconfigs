#!/bin/bash

choice=$(printf "Logout\nSuspend\nHibernate\nReboot\nShutdown" | \
  fuzzel -d || exit)

case "$choice" in
  Logout)     loginctl terminate-session "$XDG_SESSION_ID" ;;
  Suspend)    systemctl suspend ;;
  Hibernate)  systemctl hibernate ;;
  Reboot)     systemctl reboot ;;
  Shutdown)   systemctl poweroff ;;
esac
