#! /bin/bash
#################################
#
# Name: system_Info.sh
#
# Description: displays system information: uptime, current logged-in user, memory, and disk usage.
#
# Usage: ./system_info
#################################

uptime_format=$(uptime -p | sed 's/^up //')
disk_percent=$(df -h / | awk 'NR==2 {print $5}')
disk_used_and_total=$(df -h / | awk 'NR==2 {print $3"/"$2}')

echo "Uptime: ${uptime_format}"
echo "User: $(whoami)"
echo "Memory: $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
echo "Disk: ${disk_used_and_total} (${disk_percent} used)"
