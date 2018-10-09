#!/bin/sh
echo "Upload to ECR"

$(aws ecr get-login --no-include-email --region $REGION)
docker push $EKS_URI:latest
