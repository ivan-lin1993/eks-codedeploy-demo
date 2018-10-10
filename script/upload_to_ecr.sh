#!/bin/sh
echo "Upload to ECR"

$(aws ecr get-login --no-include-email --region $REGION)

echo "docker push $ECR_URI:latest"
docker push $ECR_URI:latest
