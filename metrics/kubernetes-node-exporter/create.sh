#!/bin/bash
kubectl create -f daemonset.yaml
kubectl create -f service-node-exporter.yaml
