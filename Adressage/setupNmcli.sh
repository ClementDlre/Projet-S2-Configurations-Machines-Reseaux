#!/bin/bash

systemctl enable --now NetworkManager

case $HOSTNAME in

    'alpha.d2.es')
        nmcli connection mod IF ipv4.method manual autoconnect true ipv4.addresses 5.2.4.1/25 ipv6.addresses 2E00:2:4:2::/64 ipv4.gateway 5.2.4.0 ipv6.gateway 2E00:2:4:1::
    ;;
    'beta.d2.es')
        nmcli connection mod IF ipv4.method manual autoconnect true ipv4.addresses 5.2.4.129/26 ipv6.addresses 2E00:2:4:3::/64 ipv4.gateway 5.2.4.0 ipv6.gateway 2E00:2:4:1::
    ;;
    'r1.d2.es')
        nmcli connection mod IF ipv4.method manual autoconnect true ipv4.addresses 5.2.4.0/25 ipv4.addresses 5.2.4.128/26 ipv4.addresses 5.2.4.244/30 ipv4.addresses 5.2.4.248/30 ipv4.addresses 5.2.4.252/30 ipv4.routes "5.2.4.1/25 5.2.4.1, 5.2.4.129/26 5.2.4.129,5.2.6.248/30 5.2.5.248,5.2.6.252/30 5.2.7.244,5.1.1.248/30 5.1.3.252,5.1.2.244/30 5.1.3.252 ,6.3.13.252/30 5.2.5.248,1.3.10.252/30 5.2.7.244" ipv6.addresses 2E00:2:4:1::/64 ipv6.addresses 2E00:2:4:2::/64 ipv6.addresses 2E00:2:4:3::/64 ipv6.addresses 2E00:2:4:4::/64 ipv6.addresses 2E00:2:4:5::/64 ipv6.routes "2E00:2:4:2::/64 via 2E00:2:4:2::,2E00:2:4:3::/64 2E00:2:4:2::,2E00:2:5:3::/64 2E00:2:5:4::,2E00:2:5:4::/64 2E00:2:7:3::,2E00:1:1:4::/64 2E00:1:3:5::,2E00:1:2:3::/64 2E00:1:3:5::,2F00:3:D:5::/64 2E00:2:5:4::,2A00:3:A:5::/64 2E00:2:7:3::"
    ;;
    *)
        echo "Machine non compatible"
    ;;
esac
