#!/bin/bash
apt update
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

docker buikd -t file_upload:01 .