# AWS Code Pipeline with EKS

## What
Use AWS Code Pipeline to do the CICD on AWS EKS.\
The resource update will trigger AWS Codebuild to build a docker image and upload to AWS ECR. And then use AWS Lambda to deploy your image to your EKS Cluster

## Usage

1. Create EKS cluster
    - eksctl create cluster --name {{cluster name}}
    ```
    $ eksctl create cluster -N 2 -t t2.small --name workshop
    ```
1. Create ECR repository

1. Create Codebuild role
    - S3 full access
    - ECR full access
    - CloudFormation read only
    - CloudWatch read write
    - EKS full access

1. Create Lambda Role
    - S3 full access
    - EKS full access

1. Create CodeBuild project and attach the role we created
    - Setting Environment image
        - Use an image managed by AWS CodeBuild
        - OS: Ubuntu
        - Runtime: Docker
        - Build specification: buildspec.yml
    - Setting Codebuild ENV
        - CLUSTER_NAME ( workshop )
        - S3_BUCKET ( your s3 bucket name )
        - DEPLOYFILE_NAME ( ex: eks-deployment.yml )
        - ECR_URI  ( the repository uri )
        - REGION ( us-west-2 )

1. Create Lambda Function
    - Attach Role
    - python version 3.6
    - [Code](https://github.com/ivan-lin1993/k8s-lambda-deploy)
    - Setting ENV
        - CLUSTER_NAME
        - API_ENDPOINT : EKS api endpoint
        - DEPLOYFILE_NAME  ( ex: eks-deployment.yml )
        - S3_BUCKET

1. Setting cluster auth    
    You have to add lambda role to permission to do the deploy
    ```
      $ kubectl edit -n kube-system configmap/aws-auth
    ```
    ```
    apiVersion: v1
    data:
      mapRoles: |
        - groups:
          - system:bootstrappers
          - system:nodes
          rolearn: arn:aws:iam::<ACCOUNTID>:role/EKS-workshop-DefaultNodeGroup-NodeInstanceRole-L38WNL4K7D4T
          username: system:node:{{EC2PrivateDNSName}}
        - rolearn: <LAMBDA ARN>
          username: lambda_deploy
          groups:
          - system:masters
    kind: ConfigMap
    metadata:
      creationTimestamp: 2018-09-18T02:12:32Z
      name: aws-auth
      namespace: kube-system
      resourceVersion: "26763"
      selfLink: /api/v1/namespaces/kube-system/configmaps/aws-auth
      uid: 4cfb11eb-bae8-11e8-a13f-06a8e498af66
    ```

1. Setting Code Pipeline

1. Have Fun


<hr>

https://stackoverflow.com/questions/50791303/kubectl-error-you-must-be-logged-in-to-the-server-unauthorized-when-accessing

要設定codebuild的role有
eks cloudformation 
aws-auth document
https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html

https://blog.spinnaker.io/using-aws-ecr-with-spinnaker-and-kubernetes-2b2a9bac8bd1