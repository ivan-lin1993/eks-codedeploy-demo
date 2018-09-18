#!/bin/sh
apt update
apt install -y curl wget jq docker.io

echo "restart docker"
service docker restart