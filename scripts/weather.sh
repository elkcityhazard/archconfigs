#!/bin/bash

API_URL="https://api.open-meteo.com/v1/forecast?latitude=44.7631&longitude=-85.6280&current=temperature_2m,weather_code,relative_humidity_2m,wind_speed_10m&daily=temperature_2m_max,temperature_2m_min&timezone=America/Detroit"

WEATHER=$(curl -s "$API_URL")

TEMP=$(echo "$WEATHER" | jq -r '.current.temperature_2m * 9/5 + 32 | round')
CODE=$(echo "$WEATHER" | jq -r '.current.weather_code')
HUMIDITY=$(echo "$WEATHER" | jq -r '.current.relative_humidity_2m')
WIND=$(echo "$WEATHER" | jq -r '.current.wind_speed_10m | round')
MAX=$(echo "$WEATHER" | jq -r '.daily.temperature_2m_max[0] * 9/5 + 32 | round')
MIN=$(echo "$WEATHER" | jq -r '.daily.temperature_2m_min[0] * 9/5 + 32 | round')

case $CODE in
  0) ICON="☀️" ;;
  1|2) ICON="🌤️" ;;
  3) ICON="☁️" ;;
  45|48) ICON="🌫️" ;;
  51|53|55) ICON="🌦️" ;;
  61|63|65) ICON="🌧️" ;;
  71|73|75) ICON="❄️" ;;
  80|81|82) ICON="⛈️" ;;
  85|86) ICON="🌨️" ;;
  95|96|99) ICON="⛈️" ;;
  *) ICON="❓" ;;
esac

if [ "$TEMP" -gt 85 ]; then
  CLASS="weather hot"
elif [ "$TEMP" -lt 32 ]; then
  CLASS="weather cold"
else
  CLASS="weather"
fi

echo "{\"text\": \"${ICON} ${TEMP}°F\", \"tooltip\": \"Traverse City, MI\\n${ICON} ${TEMP}°F (H: ${MAX}°F L: ${MIN}°F)\\nHumidity: ${HUMIDITY}%\\nWind: ${WIND} mph\", \"class\": \"${CLASS}\", \"alt\": \"weather\"}"
