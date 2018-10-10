#!/bin/sh
export IMAGE_VERSION=v1
echo "NOW $IMAGE_VERSION"

echo "Docker Build"

docker build -t $ECR_URI:$IMAGE_VERSION ./app

echo "Upload to ECR"

$(aws ecr get-login --no-include-email --region $REGION)

echo "docker push $ECR_URI:$IMAGE_VERSION"
docker push $ECR_URI:$IMAGE_VERSION