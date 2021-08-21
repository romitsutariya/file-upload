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