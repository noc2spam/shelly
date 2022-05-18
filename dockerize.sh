#!/bin/bash

sudo apt update &&
DEBIAN_FRONTEND=noninteractive  sudo apt upgrade -y &&
sudo apt install -y git curl nginx &&
curl -fsSL https://get.docker.com -o get-docker.sh &&

if command -v docker; then 
echo "Docker already Installed" 
else
sudo  sh ./get-docker.sh &&  echo "docker install Done"
fi && 

rm -f get-docker.sh &&

sudo apt -y install docker-compose-plugin &&
docker compose version
