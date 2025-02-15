#!/usr/bin/env bash

# Battery Information
BATTERY_PATH="/sys/class/power_supply/BAT0"
CAPACITY=$(cat "$BATTERY_PATH/capacity")
STATUS=$(cat "$BATTERY_PATH/status")

# Brightness Information
BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
BRIGHTNESS_PERCENTAGE=$((BRIGHTNESS * 100 / MAX_BRIGHTNESS))

# Volume Information (PipeWire and wpctl)
VOLUME_INFO=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOLUME=$(echo "$VOLUME_INFO" | awk '{printf "%.0f", $2 * 100}') # Extracts volume in percentage
VOLUME_STATUS=$(echo "$VOLUME_INFO" | grep -q MUTED && echo "Muted" || echo "Unmuted")

# ASCII Icons
# Battery Icon Selection
if [ "$STATUS" = "Charging" ]; then
  BATTERY_ICON="󰂄"  # Charging icon
else
  # Battery level-based icons
  if [ "$CAPACITY" -ge 90 ]; then
    BATTERY_ICON="󰁹"
  elif [ "$CAPACITY" -ge 80 ]; then
    BATTERY_ICON="󰂂"
  elif [ "$CAPACITY" -ge 70 ]; then
    BATTERY_ICON="󰂁"
  elif [ "$CAPACITY" -ge 60 ]; then
    BATTERY_ICON="󰂀"
  elif [ "$CAPACITY" -ge 50 ]; then
    BATTERY_ICON="󰁿"
  elif [ "$CAPACITY" -ge 40 ]; then
    BATTERY_ICON="󰁾"
  elif [ "$CAPACITY" -ge 30 ]; then
    BATTERY_ICON="󰁽"
  elif [ "$CAPACITY" -ge 20 ]; then
    BATTERY_ICON="󰁼"
  elif [ "$CAPACITY" -ge 10 ]; then
    BATTERY_ICON="󰁻"
  else
    BATTERY_ICON="󰂃"
  fi
fi

BRIGHTNESS_ICON="󰃠"

if [ "$VOLUME_STATUS" = "Muted" ]; then
  VOLUME_ICON="󰝟"
else
  VOLUME_ICON="󰕾"
fi

generate_bar() {
  local PERCENTAGE=$1
  local TOTAL_LENGTH=40
  local FILLED_SYMBOL="󰝤"   # Filled part symbol
  local EMPTY_SYMBOL="-"    # Empty part symbol

  # Calculate the number of filled and empty characters
  local FILLED_LENGTH=$((PERCENTAGE * TOTAL_LENGTH / 100))
  local EMPTY_LENGTH=$((TOTAL_LENGTH - FILLED_LENGTH))

  # Generate filled and empty parts directly
  local FILLED_PART=""
  local EMPTY_PART=""

  for ((i = 0; i < FILLED_LENGTH; i++)); do
    FILLED_PART+="$FILLED_SYMBOL"
  done

  for ((i = 0; i < EMPTY_LENGTH; i++)); do
    EMPTY_PART+="$EMPTY_SYMBOL"
  done

  # Combine and print the bar
  echo "${FILLED_PART}${EMPTY_PART}"
}

# Date Line (Centered)
DATE=$(date '+%Y-%m-%d %H:%M')
TOTAL_WIDTH=40
DATE_CENTERED=$(printf "%*s%s%*s" $(( (TOTAL_WIDTH - ${#DATE}) / 2 )) "" "$DATE" $(( (TOTAL_WIDTH - ${#DATE} + 1) / 2 )) "")

# Pad percentage values to 3 characters using printf
BATTERY_PADDED=$(printf "%3d" "$CAPACITY")
BRIGHTNESS_PADDED=$(printf "%3d" "$BRIGHTNESS_PERCENTAGE")
VOLUME_PADDED=$(printf "%3d" "$VOLUME")

# Bars
BATTERY_BAR=$(generate_bar "$CAPACITY")
BRIGHTNESS_BAR=$(generate_bar "$BRIGHTNESS_PERCENTAGE")
VOLUME_BAR=$(generate_bar "$VOLUME")

# Space
SPACE="                                   "

# Format the notification message with ASCII icons
NOTIFICATION_MESSAGE="\
$DATE_CENTERED
$BATTERY_ICON$SPACE$BATTERY_PADDED% $BATTERY_BAR
$BRIGHTNESS_ICON$SPACE$BRIGHTNESS_PADDED% $BRIGHTNESS_BAR
$VOLUME_ICON$SPACE$VOLUME_PADDED% $VOLUME_BAR"

# Send the notification
notify-send "$NOTIFICATION_MESSAGE"
