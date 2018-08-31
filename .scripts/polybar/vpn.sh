#!/bin/bash

# Check VPN status and store status in STATUS

#GET_VPN=$(nmcli con show | grep tun0 | cut -d ' ' -f1)
#if [[ $GET_VPN == *"tun0"* ]]
#then
#    STATUS=ON
#else
#    STATUS=OFF
#fi

if [ "$(pgrep openvpn)" ]; then
    STATUS=ON
else
    STATUS=OFF
fi

# outputs
if [[ "$STATUS" == "ON" ]]
then
#    echo " VPN"
    echo " VPN"
#    echo "VPN On "
#	 echo VPN On: `curl -4s ifconfig.co || echo no internet`
else
    echo " VPN"
fi
