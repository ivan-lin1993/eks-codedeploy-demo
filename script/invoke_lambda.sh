#!/bin/sh
aws lambda invoke --function-name $LAMBDA_NAME --payload '{"cluster_name":"'$CLUSTER_NAME'"}' ./outfile