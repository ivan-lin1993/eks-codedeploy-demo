#!/bin/sh
docker build -t $ECR_URI:$VERSION ./app
