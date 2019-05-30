#!/bin/bash

cd /etc/kubernetes/pki
(umask 077; openssl genrsa -out dashboard.key 2048)
openssl req -new -key dashboard.key -out dashboard.csr -subj "/O=bigsfintech.local/CN=kubernetes-dashboard"
openssl x509 -req -in dashboard.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out dashboard.crt -days 36500
kubectl create secret generic kubernetes-dashboard-certs --from-file=dashboard.crt=dashboard.crt --from-file=dashboard.key=dashboard.key -n kube-system
kubectl create serviceaccount dashboard-admin -n kube-system
kubectl create clusterrolebinding dashboard-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:dashboard-admin
kubectl get secret -n kube-system
