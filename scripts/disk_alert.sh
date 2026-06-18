#! /bin/bash

# =====================================================================================
# disk_alert.sh
# Check the system's disk usage of /(root directory) or any mount point.
# If the usage exceeds 80%, write a warning to the disk_alert.log with a timestamp.
# If the usage is below 80%, print to the terminal 'Disk Ok'.
# Usage: ./disk_alert.sh [argument]
# =====================================================================================

TARGET="${1:-/}"
disk_usage_percent=$(df -h "${TARGET}" | awk 'NR==2 {print $5}'| tr -d '%')
LOG_FILE="$HOME/linux-troubleshooting-scripts/log/disk_alert.log"

# Checks if the file exists.
if ! [ -e "${LOG_FILE}" ];then
        touch "${LOG_FILE}"
fi


if [ "${disk_usage_percent}" -gt 80 ]; then
        echo -e "\033[1;37m$(date)" "\033[0;33mWARNING:" "\033[1;37mDisk Usage on ${TARGET} is ${disk_usage_percent}%." | tee -a "${LOG_FILE}"
else
        echo -e "\033[1;37m$(date)" "\033[0;32mINFO:" "\033[1;37mDisk OK at ${disk_usage_percent}%." | tee -a "${LOG_FILE}"
fi

echo -e "\033[1;37m====== Results saved:" "\033[0;33m${LOG_FILE}" "\033[1;37m======"
