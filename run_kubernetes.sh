#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="nghiadoandai"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy ml-microservice --image="$dockerpath/ml-microservice:v1.0.0"


# # Step 3:
# # List kubernetes pods
kubectl get deploy,rs,svc,pods
pod_name=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")

# # Step 4:
# # Forward the container port to a host
kubectl port-forward "pod/${pod_name}" --address 0.0.0.0 8000:80
