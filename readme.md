# eksctl

1. Create cluster
    - eksctl create cluster --name {{name}}
    ```
    $ eksctl create cluster -N 2 -t t2.small --name workshop
    ```
2. Setting codebuild role (create your own)
    - eks full access
    - cloudformation full access
3. Setting cluster auth
    - kubectl edit -n kube-system configmap/aws-auth

    ```
    apiVersion: v1
    data:
      mapRoles: |
        - groups:
          - system:bootstrappers
          - system:nodes
          rolearn: arn:aws:iam::<ACCOUNTID>:role/EKS-workshop-DefaultNodeGroup-NodeInstanceRole-L38WNL4K7D4T
          username: system:node:{{EC2PrivateDNSName}}
        - rolearn: arn:aws:iam::<ACCOUNTID>:role/eks-codebuild-test
          username: ekscodebuild
          groups:
          - system:masters
        - rolearn: arn:aws:iam::<ACCOUNTID>:role/eks-work-shop-simulator
          username: system:node:{{EC2PrivateDNSName}}
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
4. create codebuild project






https://stackoverflow.com/questions/50791303/kubectl-error-you-must-be-logged-in-to-the-server-unauthorized-when-accessing

要設定codebuild的role有
eks cloudformation 
aws-auth document
https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html

https://blog.spinnaker.io/using-aws-ecr-with-spinnaker-and-kubernetes-2b2a9bac8bd1