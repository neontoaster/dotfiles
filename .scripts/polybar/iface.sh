#!/bin/bash

# use the device used for the default route
IF=$(ip route | awk '/^default/ { print $5 ; exit }')

# if the machine has no battery or wireless connection (e.g. desktop), the corresponding block should not be displayed.
[[ ! -d /sys/class/net/${IF} ]] && exit

if [[ "$(cat /sys/class/net/$IF/operstate)" = 'down' ]]; then
  echo down # full text
  exit
fi

case $1 in
  -4)
    AF=inet ;;
  -6)
    AF=inet6 ;;
  *)
    AF=inet6? ;;
esac

# if no interface is found, use the first device with a global scope
IPADDR=$(ip addr show $IF | perl -n -e "/$AF ([^\/]+).* scope global/ && print \$1 and exit")

echo "$IPADDR"
