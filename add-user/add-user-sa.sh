#!/bin/bash
# auth: winthcloud
# date: 20170514
# version: v1.0
# describe: create user and serviceaccout for kubernetes

path=/etc/kubernetes/pki/users
username="wuhan-view"
ca_cert=/etc/kubernetes/pki/ca.crt
ca_key=/etc/kubernetes/pki/ca.key
cluster_name=kubernetes-test
api_host="https://haproxy.bigsfintech.local:6443"
kubeconfig_name=${username}.kubeconfig
credentials_name=${username}-test
namespace=default


[ -d "${path}/${username}" ] || mkdir -p ${path}/${username}

genKey(){
    cd ${path}/${username}
    openssl genrsa -out ${username}.key 2048
    openssl req -new -key ${username}.key -out ${username}.csr -subj "/CN=${username}"
    openssl x509 -req -in ${username}.csr -CA ${ca_cert} -CAkey ${ca_key}  -CAcreateserial -out ${username}.crt -days 36500
}

genKubeconfig(){
    cd ${path}/${username}
    kubectl config set-cluster ${cluster_name} --certificate-authority=${ca_cert} --embed-certs=true --server="${api_host}" --kubeconfig=${kubeconfig_name}
    kubectl config set-credentials ${credentials_name} --client-certificate=${username}.crt --client-key=${username}.key --embed-certs=true --kubeconfig=${kubeconfig_name}
    kubectl config set-context ${credentials_name}@${cluster_name} --cluster=${cluster_name} --user=${credentials_name} --namespace=${namespace} --kubeconfig=${kubeconfig_name}
    kubectl config use-context ${credentials_name}@${cluster_name} --kubeconfig=${kubeconfig_name}
}

genServiceaccount(){
    kubectl get serviceaccount -n kube-system | grep "wuhan-view"
    if [ "$?" -ne 0 ];then 
        kubectl create serviceaccount wuhan-view -n kube-system
    fi
}

genKey
genKubeconfig
genServiceaccount
