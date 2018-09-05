echo "Upload to ECR"

$(aws ecr get-login --no-include-email --region us-west-2)
docker tag eks-web:latest 091393925708.dkr.ecr.us-west-2.amazonaws.com/eks-workshop:latest
docker push 091393925708.dkr.ecr.us-west-2.amazonaws.com/eks-workshop:latest