#!/bin/bash

for ns in $(kubectl get ns | awk 'NR!=1{print $1}');do
  for pod in $(kubectl get pod -n $ns | grep Evicted | awk '{print $1}' ); do
    kubectl delete pod $pod -n $ns
  done
done
