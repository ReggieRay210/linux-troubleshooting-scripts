#! /bin/bash

# =====================================================================================
# Name: disk_alert.sh
#
# Check the system's disk usage of /(root directory) or any mount point.
# If the usage exceeds 80%, write a warning to the disk_alert.log with a timestamp.
# If the usage is below 80%, print to the terminal 'Disk Ok'.
#
# Usage: ./disk_alert.sh [argument]
# =====================================================================================
set -e

TARGET="${1:-/}"
disk_usage_percent=$(df -h "${TARGET}" | awk 'NR==2 {print $5}'| tr -d '%')
LOG_FILE="$HOME/linux-troubleshooting-scripts/log/disk_alert.log"
RESULT=""

# Checks if the file exists.
if ! [ -e "${LOG_FILE}" ];then
        touch "${LOG_FILE}"
fi
echo "Copy of results will be saved: $LOG_FILE"
echo

if [ "${disk_usage_percent}" -gt 80 ]; then
        echo -e "\033[0;33mWARNING:" "\033[1;37mDisk usage on ${TARGET} is ${disk_usage_percent}%."
        RESULT="$RESULT$(date) - WARNING: Disk Usage exceeds 80%" && echo "$RESULT" &>> "${LOG_FILE}"
        exit 1
else
        echo -e "\033[0;32mINFO:" "\033[1;37mDisk OK at ${disk_usage_percent}%."
        RESULT="$RESULT$(date) - INFO: Disk usage OK" && echo "$RESULT" &>> "${LOG_FILE}"
        exit 0
fi
