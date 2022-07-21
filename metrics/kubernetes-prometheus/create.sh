#!/bin/bash
kubectl create -f clusterRole.yaml
kubectl create -f config-map.yaml
kubectl create -f prometheus-deployment.yaml
kubectl create -f service-prometheus.yaml
kubectl get pods -n monitoring
