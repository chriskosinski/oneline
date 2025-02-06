#!/bin/bash
YOURTOKEN=

STATUS=echo `nordvpn status | grep Status | cut -d":" -f2 | tr -d " "`

if [[ "$STATUS" == "Connected" ]]; then
  echo "Connected"
  
else
YOURTOKEN=
nordvpn logout #no option '--persist-token' to clear the token, wanna keep it, uncomment this option
#sleep 5
nordvpn login --token $YOURTOKEN

sleep 5
NORDVPN_COUNTRY=`cat /etc/openvpn/nordvpn-countries-codes.txt | shuf -n1`
sleep 5
nordvpn c $NORDVPN_COUNTRY
echo "connected to $NORDVPN_COUNTRY"
exit 1
fi
