#!/bin/bash
kubectl create -f datasources.yaml
kubectl create -f deployment-grafana.yaml
kubectl create -f service-grafana.yaml
