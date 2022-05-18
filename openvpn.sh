#!/bin/bash

sudo apt update &&
DEBIAN_FRONTEND=noninteractive  sudo apt upgrade -y &&
wget https://git.io/vpn -O openvpn-install.sh &&
sudo chmod +x openvpn-install.sh
sudo bash openvpn-install.sh &&
echo "Script Executed"
