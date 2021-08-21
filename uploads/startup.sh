#!/bin/bash
apt update
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

git clone https://github.com/romitsutariya/file-upload.git
cd file-upload

docker buikd -t file_upload:01 .