#!/bin/bash
kubectl delete -f prometheus-deployment.yaml
kubectl delete -f service-prometheus.yaml
kubectl delete -f config-map.yaml
kubectl delete -f clusterRole.yaml
