#! /bin/bash

######################################
# File name: network_check.sh
#
# Description: Automates a basic network health check.
# It will provide the system's public IP address, test the Ping Connection,
# DNS resolution and check if the HTTPS port is reachable.
#
# Usage: ./network_check.sh <destination URL>
######################################
set -e

DEST="${1}"
OVERALL_STATUS=0
FAIL_COUNT=0

# 1. System public IP
echo "Public IP collected: $(curl -s ifconfig.me || echo -e '\033[0;33mUnable to fetch')"

# 2. Ping connection to destination
echo "Ping test to $DEST..."
if [ -z "$DEST" ];then
        echo -e "\033[0;31mERROR:" "\033[1;37mMissing needed destination"
        exit 1
fi

if ping -c 4 "$DEST" > /dev/null 2>&1; then
        echo -e "✅ \033[0;32mPing successful"
else
        echo -e "❌  \033[0;33mPing failed"
        ((FAIL_COUNT+=1))
fi
echo

# 3. DNS Resolution
echo -e "\033[1;37mDNS resolution for $DEST..."
if dig +short "$DEST" > /dev/null 2>&1; then
        echo -e "✅ \033[0;32mDNS resolution successful"
else
        echo -e "❌ \033[0;33mDNS resolution failed"
        ((FAIL_COUNT+=1))
fi
echo

# 4. HTTPS reachability
echo -e "\033[1;37mPort 443 reachability for $DEST..."
if nc -zv -w 2 "$DEST" 443 2>&1 | grep -q "succeeded"; then
        echo -e "✅ \033[0;32mPort 443 is reachable."
else
        echo -e "❌ \033[0;33mPort 443 is not reachable."
        ((FAIL_COUNT+=1))
fi
echo
echo -e "\033[1;37m--- Network Check Complete ---"

if [ "$FAIL_COUNT" -eq 0 ];then
        echo "✅ All network checks passed."
        exit 0
else
        echo "❌ Some network checks failed."
        exit 1
fi
