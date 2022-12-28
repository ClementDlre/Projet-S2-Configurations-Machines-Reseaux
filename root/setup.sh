systemctl enable --now NetworkManager
nmcli con mod eth0 ipv4.method manual autoconnect true ipv4.addresses 10.0.56.20/24
