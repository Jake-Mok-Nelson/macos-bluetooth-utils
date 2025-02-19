#!/bin/bash
# This script disconnects and unpairs (forgets) specified Bluetooth devices.
# Requires blueutil (install via: brew install blueutil)

set -euo pipefail

# List of Bluetooth device MAC addresses to disconnect and forget.
MACOS_KEYBOARD=10-94-bb-b5-cc-72
MACOS_MOUSE=24-1b-7a-64-9d-b1
DEVICES=("${MACOS_KEYBOARD}" "${MACOS_MOUSE}")

for device in "${DEVICES[@]}"; do
  echo "Disconnecting device $device..."
  blueutil --disconnect "$device"   # Disconnect the device
  sleep 1  # Brief pause between commands
  
  echo "Forgetting (unpairing) device $device..."
  blueutil --unpair "$device"       # Unpair the device (if supported)
  sleep 1
done

echo "Devices have been disconnected and forgotten."
