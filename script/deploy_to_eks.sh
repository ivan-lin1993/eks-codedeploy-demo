#!/bin/sh

aws sts get-caller-identity

kubectl apply -f ./app/deployment.yaml

kubectl get deployments
kubectl get pods