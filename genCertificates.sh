#!/bin/bash
# Description: generate certs for k8s master host
# Date: 20190625
# version: 1.0
# Author: winthcloud
# bash genCertificates.sh 172.17.0.230 node1 node1.cluster.local 172.30.0.1
host_ip=$1
host_name=$2
api_server=$3
k8s_service_ip=$4
etcdPeerCN=${host_name}
etcdPeerIP1=${host_ip}
apiserverDns1=${host_name}
#service IP (below)
apiserverIP1=${k8s_service_ip}
apiserverIP2=${host_ip}
apiserverEndpointDNS=${api_server}
keypath=/etc/kubernetes/pki

[ -z "${host_ip}" ] && echo "You need to input host IP" && exit 200
[ -z "${host_name}" ] && echo "You need to input host name" && exit 200
[ -z "${api_server}" ] && echo "You need to input api server name" && exit 200
[ -z "${k8s_service_ip}" ] && echo "You need to input k8s service IP" && exit 200

#[ -d "$keypath" ] && rm -rf $keypath
[ -d "$keypath/etcd" ] || mkdir $keypath/etcd -p
cd $keypath

#gen api-ca
if [ -f "ca.key" ];then
	echo ca exists
else
(umask 077;openssl genrsa -out ca.key 2048)
cat > apiserver-ca-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
#O = <organization>
#OU = <organization unit>
CN = kubernetes

[ req_ext ]
#subjectAltName = @alt_names

[ alt_names ]

[ v3_ext ]
keyUsage=critical,Digital Signature,Key Encipherment,Certificate Sign
basicConstraints=critical,CA:true
EOF
openssl req -x509 -new -nodes -key ca.key -days 36500 -config apiserver-ca-csr.conf -extensions v3_ext -set_serial 0 -out ca.crt
rm -f apiserver-ca-csr.conf
fi

#gen front-proxy-ca
if [ -f "front-proxy-ca.key" ];then
    echo front-proxy-ca.key exists
else
(umask 077;openssl genrsa -out front-proxy-ca.key 2048)
cat > front-proxy-ca-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
#O = <organization>
#OU = <organization unit>
CN = front-proxy-ca

[ req_ext ]
#subjectAltName = @alt_names

[ alt_names ]

[ v3_ext ]
keyUsage=critical,Digital Signature,Key Encipherment,Certificate Sign
basicConstraints=critical,CA:true
EOF
openssl req -x509 -new -nodes -key front-proxy-ca.key -days 36500 -config front-proxy-ca-csr.conf -extensions v3_ext -set_serial 0 -out front-proxy-ca.crt
rm -f front-proxy-ca-csr.conf
fi

#gen sa.key
if [ -f "sa.key" ];then
	echo sa.key exists
else
(umask 077;openssl genrsa -out sa.key 2048)
(umask 077;openssl rsa -pubout -in sa.key -out sa.pub)
fi

cd etcd
#gen etcd-ca
if [ -f "ca.key" ];then
	echo etcd-ca.key exists
else
(umask 077;openssl genrsa -out ca.key 2048)
cat > etcd-ca-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
#O = <organization>
#OU = <organization unit>
CN = etcd-ca

[ req_ext ]
#subjectAltName = @alt_names

[ alt_names ]

[ v3_ext ]
keyUsage=critical,Digital Signature,Key Encipherment,Certificate Sign
basicConstraints=critical,CA:true
EOF
openssl req -x509 -new -nodes -key ca.key -days 36500 -config etcd-ca-csr.conf -extensions v3_ext -set_serial 0 -out ca.crt
rm -f etcd-ca-csr.conf
fi

cd ..
#gen apiserver-etcd-client.crt
if [ -f "apiserver-etcd-client.key" ];then
	echo apiserver-etcd-client.key exists
else
(umask 077;openssl genrsa -out apiserver-etcd-client.key 2048)
cat > apiserver-etcd-client-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
O = system:masters
#OU = <organization unit>
CN = kube-apiserver-etcd-client

[ alt_names ]

[ v3_ext ]
keyUsage=critical,digitalSignature,keyEncipherment
extendedKeyUsage=clientAuth
EOF
openssl req -new -key apiserver-etcd-client.key -out apiserver-etcd-client.csr -config apiserver-etcd-client-csr.conf
openssl x509 -req -in apiserver-etcd-client.csr -CA etcd/ca.crt -CAkey etcd/ca.key -set_serial $(date +%s%N) -out apiserver-etcd-client.crt -days 36500 -extensions v3_ext -extfile apiserver-etcd-client-csr.conf
rm -f apiserver-etcd-client.csr apiserver-etcd-client-csr.conf
fi

#gen apiserver.crt
if [ -f "apiserver.key" ];then
	echo apiserver.key exists
else
(umask 077;openssl genrsa -out apiserver.key 2048)
cat > apiserver-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
#O = <organization>
#OU = <organization unit>
CN = kube-apiserver

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = ${apiserverDns1}
DNS.2 = kubernetes
DNS.3 = kubernetes.default
DNS.4 = kubernetes.default.svc
DNS.5 = kubernetes.default.svc.cluster
DNS.6 = kubernetes.default.svc.cluster.local
DNS.7 = $apiserverEndpointDNS
IP.1 = ${apiserverIP1}
IP.2 = ${apiserverIP2}

[ v3_ext ]
keyUsage=critical,digitalSignature,keyEncipherment
extendedKeyUsage=serverAuth
subjectAltName=@alt_names
EOF
openssl req -new -key apiserver.key -out apiserver.csr -config apiserver-csr.conf
openssl x509 -req -in apiserver.csr -CA ca.crt -CAkey ca.key -set_serial $(date +%s%N) -out apiserver.crt -days 36500 -extensions v3_ext -extfile apiserver-csr.conf
rm -f apiserver.csr apiserver-csr.conf
fi

#gen apiserver-kubelet-client.crt
if [ -f "apiserver-kubelet-client.key" ];then
	echo apiserver-kubelet-client.key exists
else
(umask 077;openssl genrsa -out apiserver-kubelet-client.key 2048)
cat > apiserver-kubelet-client-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
O = system:masters
#OU = <organization unit>
CN = kube-apiserver-kubelet-client

[ req_ext ]
#subjectAltName = @alt_names

[ alt_names ]

[ v3_ext ]
keyUsage=critical,digitalSignature,keyEncipherment
extendedKeyUsage=clientAuth
EOF
openssl req -new -key apiserver-kubelet-client.key -out apiserver-kubelet-client.csr -config apiserver-kubelet-client-csr.conf
openssl x509 -req -in apiserver-kubelet-client.csr -CA ca.crt -CAkey ca.key -set_serial $(date +%s%N) -out apiserver-kubelet-client.crt -days 36500 -extensions v3_ext -extfile apiserver-kubelet-client-csr.conf
rm -f apiserver-kubelet-client.csr apiserver-kubelet-client-csr.conf
fi

#gen front-proxy-client.crt
if [ -f "front-proxy-client.key" ];then
	echo front-proxy-client.key exists
else
(umask 077;openssl genrsa -out front-proxy-client.key 2048)
cat > front-proxy-client-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
#O = <organization>
#OU = <organization unit>
CN = front-proxy-client

[ req_ext ]
#subjectAltName = @alt_names

[ alt_names ]

[ v3_ext ]
keyUsage=critical,digitalSignature,keyEncipherment
extendedKeyUsage=clientAuth
EOF
openssl req -new -key front-proxy-client.key -out front-proxy-client.csr -config front-proxy-client-csr.conf
openssl x509 -req -in front-proxy-client.csr -CA front-proxy-ca.crt -CAkey front-proxy-ca.key -set_serial $(date +%s%N) -out front-proxy-client.crt -days 36500 -extensions v3_ext -extfile front-proxy-client-csr.conf
rm -f front-proxy-client.csr front-proxy-client-csr.conf
fi

cd etcd
#gen health-check-crt
if [ -f "healthcheck-client.key" ];then
	echo healthcheck-client.key exists
else
(umask 077;openssl genrsa -out healthcheck-client.key 2048)
cat > health-etcd-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
O = system:masters
#OU = <organization unit>
CN = kube-etcd-healthcheck-client


[ alt_names ]

[ v3_ext ]
keyUsage=critical,digitalSignature,keyEncipherment
extendedKeyUsage=clientAuth
EOF
openssl req -new -key healthcheck-client.key -out healthcheck-client.csr -config health-etcd-csr.conf
openssl x509 -req -in healthcheck-client.csr -CA ca.crt -CAkey ca.key -out healthcheck-client.crt -days 36500 -set_serial $(date +%s%N) -extensions v3_ext -extfile health-etcd-csr.conf
rm -f healthcheck-client.csr health-etcd-csr.conf
fi

#gen etcd-peer-crt
if [ -f "peer.key" ];then
	echo peer.key exists
else
(umask 077;openssl genrsa -out peer.key 2048)
cat > etcd-peer-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
#O = 
#OU = <organization unit>
CN = ${etcdPeerCN}

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = ${etcdPeerCN}
DNS.2 = localhost
IP.1 = ${etcdPeerIP1}
IP.2 = 127.0.0.1
IP.3 = 0:0:0:0:0:0:0:1

[ v3_ext ]
keyUsage=critical,digitalSignature,keyEncipherment
extendedKeyUsage=serverAuth,clientAuth
subjectAltName=@alt_names
EOF
openssl req -new -key peer.key -out peer.csr -config etcd-peer-csr.conf
openssl x509 -req -in peer.csr -CA ca.crt -CAkey ca.key -set_serial $(date +%s%N) -out peer.crt -days 36500 -extensions v3_ext -extfile etcd-peer-csr.conf
rm -f peer.csr etcd-peer-csr.conf
fi

#gen etcd-server.crt
if [ -f server.key ];then
	echo server.key exists
else
(umask 077;openssl genrsa -out server.key 2048)
cat > etcd-server-csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
#C = <country>
#ST = <state>
#L = <city>
#O = 
#OU = <organization unit>
CN = ${etcdPeerCN}

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = ${etcdPeerCN}
DNS.2 = localhost
IP.1 = ${etcdPeerIP1}
IP.2 = 127.0.0.1
IP.3 = 0:0:0:0:0:0:0:1

[ v3_ext ]
keyUsage=critical,digitalSignature,keyEncipherment
extendedKeyUsage=serverAuth,clientAuth
subjectAltName=@alt_names
EOF
openssl req -new -key server.key -out server.csr -config etcd-server-csr.conf
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -set_serial $(date +%s%N) -out server.crt -days 36500 -extensions v3_ext -extfile etcd-server-csr.conf
rm -f server.csr etcd-server-csr.conf
fi
