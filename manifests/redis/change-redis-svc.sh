#!/bin/bash

file=/opt/manifests/redis/redis-svc.yaml

change_redis_svc(){
    svcip=$(/usr/local/bin/redis-cli -h 172.30.97.181 -p 26379 sentinel get-master-addr-by-name mymaster | head -n1 |cut -d'"' -f2)
    num=$(kubectl get svc | grep ${svcip} | awk '{print $1}' | cut -d'-' -f5)

    cat > ${file} <<EOF
apiVersion: v1
kind: Service
metadata:
  name: redis-svc
  namespace: default
  labels:
    app: redis
spec:
  ports:
  - name: redis
    port: 6379
    targetPort: 6379
  - name: sentinel
    port: 26379
    targetPort: 26379
  selector:
    app: redis-ha
    release: redis
    statefulset.kubernetes.io/pod-name: redis-redis-ha-server-${num}
EOF
    kubectl apply -f ${file}
}

count=0
while [ "${count}" -le 3 ]; do
    change_redis_svc
    count=$[${count}+1]
    sleep 10
done

