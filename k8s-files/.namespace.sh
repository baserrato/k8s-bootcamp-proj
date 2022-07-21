#!/bin/bash

if [[ $1 == 'namespace' ]]; then
  kubectl config set-context --current --namespace=$2
fi
