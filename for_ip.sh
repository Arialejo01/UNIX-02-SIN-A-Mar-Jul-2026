#!/bin/bash
for ip_address in "$@"; do
echo "Taking some action on IP address ${ip_address}"
ping -c 1 ${ip_address}
done
#127.0.0.1
#10.0.10.198
#172.17.0.1
#172.17.255.255
#10.0.255.255