#!/bin/sh
docker build -t $ECR_URI:$IMAGE_VERSION ./app
