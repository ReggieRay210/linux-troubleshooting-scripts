#! /bin/bash

######################################
# File name: network_check.sh
# Description: Automates a basic network health check.
# It will provide the system's public IP address, test the Ping Connection,
# DNS resolution and check if the HTTPS port is reachable.
#
# Usage: ./network_check.sh <destination URL>
######################################
set -e

DEST="${1}"

echo "====== Network Health Check ======"
echo "Date: $(date)"

# 1. System public IP
echo "Public IP collected: $(curl -s ifconfig.me || echo -e '\033[0;33mUnable to fetch')"

# 2. Ping connection to destination
echo "Ping test to $DEST..."
if [ -z "$DEST" ];then
        echo -e "\033[0;31mERROR:" "\033[1;37mMissing needed destination"
        exit 1
fi

if ping -c 4 "$DEST" > /dev/null 2>&1; then
        echo -e "\033[0;32mPing successful"
else
        echo -e "\033[0;33mPing failed"
fi

# 3. DNS Resolution
echo "DNS resolution for $DEST..."
if dig +short "$DEST" > /dev/null; then
        echo -e "\033[0;32mDNS resolution successful"
else
        echo -e "\033[0;33mDNS resolution failed"
fi

# 4. HTTPS reachability
echo "Port 443 reachability for $DEST..."
if nc -zv "$DEST" 443 2>&1 | grep -q "succeeded"; then
        echo -e "\033[0;32mPort 443 is reachable."
else
        echo -e "\033[0;33mPort 443 is not reachable."
fi
echo
echo "====== Network Check Complete ======"
