#! /bin/bash

# Name: restart_service.sh
# Description: Restarts or starts a user-level systemd service
# Usage: ./restart_service.sh <service-name>

set -e

SERVICE="$1"

# Check if service argument is listed
if [ -z "$SERVICE" ]; then
        echo -e "\033[0;31mError: ""\033[1;30mMissing needed service unit."
        exit 1
fi

LOG_FILE="$HOME/linux-troubleshooting-scripts/service_restarts.log"

# Check if service is active
if systemctl --user is-active --quiet "$SERVICE"; then
        echo "$(date): Restarting $SERVICE..." >> "$LOG_FILE"
        systemctl --user restart "$SERVICE"
        echo "$(date): $SERVICE restarted" >> "$LOG_FILE"
else
        echo "$(date): $SERVICE is not running. Starting service..." >> "$LOG_FILE"
        systemctl --user start "$SERVICE"
        echo "$(date): $SERVICE Started." >> "$LOG_FILE"
fi
