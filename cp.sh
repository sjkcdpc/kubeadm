#!/bin/bash

dest=/root/kubeadm/k8s/pki
[ -d "/root/kubeadm/k8s" ] && rm /root/kubeadm/k8s -rf
mkdir /root/kubeadm/k8s/pki/etcd -pv

cp /etc/kubernetes/pki/ca.{crt,key} $dest
cp /etc/kubernetes/pki/sa.{key,pub} $dest
cp /etc/kubernetes/pki/front-proxy-ca.{crt,key} $dest
cp /etc/kubernetes/pki/etcd/ca.{crt,key} $dest/etcd
cp /etc/kubernetes/admin.conf /root/kubeadm/k8s

scp -pr /root/kubeadm/k8s/* 172.17.0.228:/etc/kubernetes
scp -pr /root/kubeadm/k8s/* 172.17.0.229:/etc/kubernetes
#scp -pr /root/kubeadm/k8s/* 172.17.2.130:/etc/kubernetes
