#!/bin/bash

case $HOSTNAME in 
    'alpha.d2.es')
        ip addr add 5.2.4.1/25 brd + dev eth0
        ip addr add 2E00:2:4:2::/64 dev eth0
        ip link set dev eth0 up
        ip route add to default via 5.2.4.0 dev eth0
    ;;
    'beta.d2.es')
        ip addr add 5.2.4.129/26 brd + dev eth0
        ip addr add 2E00:2:4:3::/64 dev eth0
        ip link set dev eth0 up
        ip route add to default via 5.2.4.128 dev eth1
    ;;
    'r1.d2.es')
        ip addr add 5.2.4.0/25 brd + dev eth0
        ip addr add 5.2.4.128/26 brd + dev eth1
        ip addr add 5.2.4.244/30 brd + dev wan0
        ip addr add 5.2.4.248/30 brd + dev wan1
        ip addr add 5.2.4.252/30 brd + dev wan2
        ip addr add 2E00:2:4:1::/64 dev eth0
        ip addr add 2E00:2:4:2::/64 dev eth1
        ip addr add 2E00:2:4:3::/64 dev wan0
        ip addr add 2E00:2:4:4::/64 dev wan1
        ip addr add 2E00:2:4:5::/64 dev wan2
        ip link set dev eth0 up
        ip link set dev eth1 up
        ip link set dev wan0 up
        ip link set dev wan1 up
        ip link set dev wan2 up
        ip route add to 5.2.4.1/25 via 5.2.4.1 dev eth0
        ip route add to 5.2.4.129/26 via 5.2.4.129 dev eth1
        ip route add to 5.2.6.248/30 via 5.2.5.248 dev wan0
        ip route add to 5.2.6.252/30 via 5.2.7.244 dev wan1
        ip route add to 5.1.1.248/30 via 5.1.3.252 dev wan2
        ip route add to 5.1.2.244/30 via 5.1.3.252 dev wan2
        ip route add to 6.3.13.252/30 via 5.2.5.248 dev wan0
        ip route add to 1.3.10.252/30 via 5.2.7.244 dev wan1
        ip route add to 2E00:2:4:2::/64 via 2E00:2:4:2:: dev eth0
        ip route add to 2E00:2:4:3::/64 via 2E00:2:4:2:: dev eth1
        ip route add to 2E00:2:5:3::/64 via 2E00:2:5:4:: dev wan0
        ip route add to 2E00:2:5:4::/64 via 2E00:2:7:3:: dev wan1
        ip route add to 2E00:1:1:4::/64 via 2E00:1:3:5:: dev wan2
        ip route add to 2E00:1:2:3::/64 via 2E00:1:3:5:: dev wan2
        ip route add to 2F00:3:D:5::/64 via 2E00:2:5:4:: dev wan0
        ip route add to 2A00:3:A:5::/64 via 2E00:2:7:3:: dev wan1
    ;;
    *)
        echo "Machine non compatible"
    ;;
esac