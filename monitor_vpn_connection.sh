
#!/bin/bash
echo "checking the state of the VPN connection..."
VPN_gateway="10.xxx.xxx.xxx"
local_address="172.xxx.xxx.xxx"
flag=1
mkdir -p /var/run/xl2tpd
touch /var/run/xl2tpd/l2tp-control

while true
do
  ping -s 1 -c 1 $VPN_gateway
  if [ "$?" != "0" ]
  then
     echo "VPN is offline,trying to connect..."
     echo "c myvpn" > /var/run/xl2tpd/l2tp-control
     sleep 5
  else
     echo "vpn is online!"
     ping -s 1 -c 1 $local_address
     if [ "$?" != "0" ]
     then
        echo "adding the local addresses and gw to route table..."
        route add 172.16.xxx.xxx gw 10.xxx.xxx.xxx
        route add 172.16.xxx.xxx gw 10.xxx.xxx.xxx

     fi
     sleep 5
  fi
  done
