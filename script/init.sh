#!/bin/sh
echo "Download the dependency......"
apt update
apt install -y curl wget jq

export VERSION=v1