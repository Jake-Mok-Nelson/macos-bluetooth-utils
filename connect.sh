#!/bin/bash
# This script connects to specified Bluetooth devices.
# Requires blueutil (install via: brew install blueutil)

set -euo pipefail

# List of Bluetooth device MAC addresses to connect.
MACOS_KEYBOARD=10-94-bb-b5-cc-72
MACOS_MOUSE=24-1b-7a-64-9d-b1
DEVICES=("${MACOS_KEYBOARD}" "${MACOS_MOUSE}")

for device in "${DEVICES[@]}"; do
  echo "Connecting to device $device..."
  blueutil --connect "$device"     # Connect to the device
  sleep 4  # Brief pause between commands
done

echo "Devices have been connected."
