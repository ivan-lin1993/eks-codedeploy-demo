#!/bin/sh
echo "Upload to ECR"

$(aws ecr get-login --no-include-email --region $REGION)

echo "docker push $EKS_URI:latest"
docker push $EKS_URI:latest
