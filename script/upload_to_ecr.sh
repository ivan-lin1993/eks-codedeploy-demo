#!/bin/sh
echo "Upload to ECR"

$(aws ecr get-login --no-include-email --region $REGION)

echo "docker push $ECR_URI:$IMAGE_VERSION"
docker push $ECR_URI:$IMAGE_VERSION
