#! /bin/bash

# =====================================================================================
# disk_alert.sh
# Check the system's disk usage of /(root directory) or any mount point.
# If the usage exceeds 80%, write a warning to the disk_alert.log with a timestamp.
# If the usage is below 80%, print to the terminal 'Disk Ok'.
# Usage: ./disk_alert.sh [argument]
# =====================================================================================

TARGET="${1:-/}"

LOG_FILE="$HOME/linux-troubleshooting-scripts/disk_alert.log"
disk_usage_percent=$(df -h "${TARGET}" | awk 'NR==2 {print $5}'| tr -d '%')

if [ "${disk_usage_percent}" -gt 80 ]; then
        echo -e "$(date) \033[0;33mWARNING: Disk Usage on ${TARGET} is ${disk_usage_percent}%." >> "$LOG_FILE"
else
        echo -e "$(date) \033[0;32mINFO: Disk OK at ${disk_usage_percent}%."
fi
