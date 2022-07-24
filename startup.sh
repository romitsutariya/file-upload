#!/bin/bash
apt update
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#this is the run docker without sudo command
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 
docker build -t romitsutariya/file-upload:1.0 .
docker run -d  -p 8080:8080 --env PORT=8080 --env FILE_UPLOAD_URI=/tmp/ romitsutariya/file-upload:1.0
echo $CR_PAT | docker login ghcr.io -u romitsutariya --password-stdin
docker tag  454 ghcr.io/romitsutariya/file-upload:1.0
docker push ghcr.io/romitsutariya/file-upload:1.0

docker run -it -d --rm -v $HOME/app:. --name scripts -p 8080:8080  --env PORT=8080 --env FILE_UPLOAD_URI=. romitsutariya/file-upload:1.0
docker run -it -d --rm -v $HOME/nodejs:/app --name scripts -p 8080:8080  --env PORT=8080 --env FILE_UPLOAD_URI=/app romitsutariya/file-upload:1.0

df -h  # show all mounted drive
lsblk   #  show all attached volume

file -s  /dev/scdf 

mkfs -t ext4 /dev/xvsf

mount /dev/xvdf  ./nodejs