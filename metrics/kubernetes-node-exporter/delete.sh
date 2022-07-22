#!/bin/bash
kubectl delete -f daemonset.yaml
kubectl delete -f service-node-exporter.yaml
