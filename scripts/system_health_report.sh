#! /bin/bash

##############################################
#
# File Name: system_health_report.sh
#
# Description: Performs a comprehensive system health check
# and presents a summary report.
#
# Usage: system_health_report <URL - optional>
# If URL is added, it will perform the network check to that URL.
##############################################

SUMMARY_FILE="$HOME/linux-troubleshooting-scripts/log/summary_report.log"
RESULTS=""
OVERALL_STATUS=0

# Looks for a destination argument, if not, will use 8.8.8.8
DEST="${1:-8.8.8.8}"

# Checks if the file exists, if not, create file and absolute path if needed.
if ! [ -e "${SUMMARY_FILE}" ];then
        touch "${SUMMARY_FILE}"
fi

echo "====== SYSTEM HEALTH CHECK ======"
echo "$(date)"
echo

# Display system information
echo "--- System Info ---"
./system_info.sh
echo

echo "--- Disk Usage ---"
# Display disk usage and check the exit status.
if ! ./disk_alert.sh; then
        OVERALL_STATUS=1
        RESULTS="$RESULTS\n     - Disk Usage over 80%"
fi
echo

# Display Network Health and check the exit status.
echo "--- Network Health Check ---"
if ! ./network_check.sh "$DEST"; then
        OVERALL_STATUS=1
        RESULTS="$RESULTS\n     - Network check failed for $DEST"
fi
echo

# Display status of reporter.service
echo "--- Service Status ---"
if systemctl --user is-active --quiet reporter.service; then
    echo "✅ reporter.service: active (running)"
else
    echo "❌ reporter.service: inactive or failed"
    RESULTS="$RESULTS\n - reporter.service is not running"
    OVERALL_STATUS=1
fi
echo

# Display Summary
echo "====== REPORT SUMMARY ======" | tee -a "${SUMMARY_FILE}"
echo "$(date)" &>> "${SUMMARY_FILE}"
if [ $OVERALL_STATUS -eq 0 ];then
        echo "✅ All systems are operational - PASS"
        echo "Status: ✅ PASS" &>> "${SUMMARY_FILE}"
else
        echo "❌ One or more checks FAILED"
        echo "Status: ❌ FAIL" &>> "${SUMMARY_FILE}"
        echo -e "Failed Checks:$RESULTS" | tee -a "${SUMMARY_FILE}"
fi
echo -e "====== END OF REPORT ======\n" &>> "${SUMMARY_FILE}"
echo "Copy of results will be saved: ${SUMMARY_FILE}"
