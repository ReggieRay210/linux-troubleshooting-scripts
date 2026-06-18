#!/bin/bash

LOG_FILE="$HOME/linux-troubleshooting-scripts/reporter.log"

while true;do
        echo "$(date): Service Started..." &>> "$LOG_FILE"
        sleep 30
done
