#!/bin/sh

wget https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/bin/
wget https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/heptio-authenticator-aws && chmod +x heptio-authenticator-aws && mv heptio-authenticator-aws /usr/bin/

curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/bin

eksctl utils write-kubeconfig --name $CLUSTER_NAME

# echo "Setting kubectl Auth"
curl -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/aws-auth-cm.yaml
CODEBUILD_ROLE_ARN_TEMP=$(echo $ROLE_ARN_CODEBUILD | sed 's/\//\\\//')
NODE_ROLE_ARN_TEMP=$(echo $NODE_ROLE_ARN | sed 's/\//\\\//')
cat ./script/codebuild_credential.yaml | sed "s/<CODEBUILD_ROLEARN>/$CODE_BUILD_ROLE_ARN_TEMP/; s/<NODE_ROLEARN>/<$NODE_ROLE_ARN_TEMP>/" > new_aws_cm.yaml


kubectl apply -f new_aws_cm.yaml