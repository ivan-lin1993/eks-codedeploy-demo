#!/bin/sh

kubectl apply -f ./app/deployment.yaml

kubectl get deployments
kubectl get pods