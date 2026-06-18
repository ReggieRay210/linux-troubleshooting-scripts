#! /bin/bash

# log_analyzer.sh
# Provides a summary of: Total number of lines within the log, the amount of 'ERROR' and 'WARNING' messages.
# Displays the last 5 lines of the log.

set -e

TARGET_FILE="${1}"


if [[ -z "${TARGET_FILE}" ]];then
        echo -e "\033[0;31mERROR:" "\033[1;37mMissing needed log file."
        exit 1
else
        line_count=$(wc -l "${TARGET_FILE}" | awk '{print $1}')
        error_count=$(grep -ic "error" "${TARGET_FILE}")
        warn_count=$(grep -ic "warn" "${TARGET_FILE}")

        echo "=== Analyzing log: ${TARGET_FILE} ==="
        echo "File Contains: ${line_count} lines."
        echo "Reported: ${error_count} error messages."
        echo "Reported: ${warn_count} warning messages."
        echo -e "\n=== Last five(5) lines ==="
        tail -n 5 "${TARGET_FILE}"
fi
