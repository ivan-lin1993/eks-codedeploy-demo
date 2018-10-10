#!/bin/sh
echo "Upload to ECR"

$(aws ecr get-login --no-include-email --region $REGION)

echo "docker push $ECR_URI:$VERSION"
docker push $ECR_URI:$VERSION
