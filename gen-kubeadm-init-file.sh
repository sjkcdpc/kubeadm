#!/bin/bash
# Description: generate kubernetes kubeadm init file
# Date: 20190625
# Version: 1.0
# Author: Winthcloud

host_name=$1
api_server=$2
service_subnet=$3
pod_subnet=$4

[ -z "${host_name}" ] && echo "You need intpu host name" && exit 200
[ -z "${api_server}" ] && echo "You need intpu api server name" && exit 200
[ -z "${service_subnet}" ] && echo "You need intpu k8s service subnet" && exit 200
[ -z "${pod_subnet}" ] && echo "You need intpu k8s pod subnet" && exit 200


cat <<EOF > /tmp/init.yaml
apiVersion: kubeadm.k8s.io/v1beta1
kind: ClusterConfiguration
kubernetesVersion: v1.13.3
imageRepository: registry.cn-hangzhou.aliyuncs.com/google_containers
etcd:
  local:
    imageTag: "3.2.24"
    dataDir: "/data/kubernetes/etcd"
controllerManager:
  extraArgs:
    horizontal-pod-autoscaler-sync-period: "10s"
apiServer:
  extraArgs:
    service-node-port-range: "1-65535"
    runtime-config: "api/all=true"
  certSANs:
  - "${host_name}"
controlPlaneEndpoint: "${api_server}:6443"
networking:
  serviceSubnet: "${service_subnet}"
  podSubnet: "${pod_subnet}"
  dnsDomain: "cluster.local"
---
apiVersion: kubeproxy.config.k8s.io/v1alpha1
kind: KubeProxyConfiguration
mode: ipvs
EOF
