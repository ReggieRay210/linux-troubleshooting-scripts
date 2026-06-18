#! /bin/bash

# ===============================================
# Name: backup.sh
# Copies .txt files that are listed in the given Source directory and copies them to the Destination directory.
#
#
# Usage: ./backup.sh
# ===============================================

set -e
SOURCE="${1}"
DEST="${2}"

if [[ -z "${SOURCE}" || -z "${DEST}" ]]; then
        echo -e "\033[0;31mERROR:" "\033[1;37mMissing needed arguments"
        exit 1
fi

if [[ -d "${SOURCE}" ]]; then
        if [[ -d "${DEST}" ]]; then
                cp -v "${SOURCE}"/*.txt "${DEST}"
                echo -e "\033[0;32mBackup Complete"
                ls -l "${DEST}" | awk '{print $9}'
        else
                mkdir -p ./"${DEST}"
                cp -v "${SOURCE}"/*.txt "${DEST}"
                echo -e "\033[0;32mBackup Complete\n""\033[1;37mThese files were backed up:"
                ls -l "${DEST}" | awk '{print $9}'
        fi
else
        echo -e "\033[0;31mERROR:" "\033[1;37m${SOURCE} does not exist or it is a file."
        exit 1
fi
