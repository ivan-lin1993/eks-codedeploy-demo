FROM ubuntu:18.04

RUN apt update
RUN curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl ~/bin/
RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator && chmod +x aws-iam-authenticator && mv aws-iam-authenticator ~/bin/ && cd ~/bin && ln -s aws-iam-authenticator heptio-authenticator-aws

COPY . /src
WORKDIR /src

RUN ./init.sh

