#!/bin/bash
# Describe: auto install kubernetes
# Date: 20190625
# Version: v0.1
# Author: Winthcloud

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF


cat <<EOF >> /etc/rc.local
modprobe -- ip_vs
modprobe -- ip_vs_rr
modprobe -- ip_vs_wrr
modprobe -- ip_vs_sh
modprobe -- nf_conntrack_ipv4
EOF

chmod +x /etc/rc.local
bash /etc/rc.local

yum install kubelet-1.13.3 -y
yum install kubectl-1.13.3 kubeadm-1.13.3 ipvsadm -y

cat > /etc/sysconfig/kubelet <<EOF
KUBELET_EXTRA_ARGS="--root-dir=/data/kubelet"
EOF

swapoff -a
sed -i 's/.*swap.*/#&/' /etc/fstab
