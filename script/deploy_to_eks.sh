#!/bin/sh

aws sts get-caller-identity

kubectl apply -f ./app/deployment.yml

kubectl get deployments
kubectl get pods