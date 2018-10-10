#!/bin/sh
echo "Download the dependency......"
apt update
apt install -y curl wget jq

export IMAGE_VERSION=v1
echo "NOW $IMAGE_VERSION"