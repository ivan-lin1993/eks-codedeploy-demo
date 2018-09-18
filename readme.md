# eksctl

1. Create cluster
    - eksctl create cluster --name {{name}}
    ```
    $ eksctl create cluster -N 2 -t t2.small --name workshop
    ```
2. Setting codebuild role
    - eks full access
    - cloudformation full access
3. Setting cluster auth
    - kubectl edit -n kube-system configmap/aws-auth
4. create codebuild project






https://stackoverflow.com/questions/50791303/kubectl-error-you-must-be-logged-in-to-the-server-unauthorized-when-accessing

要設定codebuild的role有
eks cloudformation 
aws-auth document
https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html