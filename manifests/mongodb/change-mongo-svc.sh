#!/bin/bash
# date: 190515
# version: v1.0
# describe: change the master pod of mongodb

svc_yaml="/opt/manifests/mongodb/mongo-master-svc.yaml"
tmp_file="/tmp/mongo-master.txt"

change_master(){
    for ((i = 0; i < 3; ++i)); do kubectl exec --namespace default mongo-mongodb-replicaset-$i -c mongodb-replicaset -- sh -c 'mongo --eval="printjson(rs.isMaster())"'; done > ${tmp_file}

    name=$(grep -A 3 '"ismaster" : true' ${tmp_file} | tail -n1 | cut -d'.' -f1 | cut -d'"' -f4)


    cat > ${svc_yaml} <<EOF
apiVersion: v1
kind: Service
metadata:
  labels:
    app: mongodb-replicaset
    chart: mongodb-replicaset-3.9.2
    heritage: Tiller
    release: mongo
  name: mongodb
  namespace: default
spec:
  ports:
  - name: mongodb
    port: 27017
    protocol: TCP
    targetPort: 27017
  selector:
    app: mongodb-replicaset
    release: mongo
    statefulset.kubernetes.io/pod-name: ${name}
  type: ClusterIP
EOF

    kubectl apply -f ${svc_yaml}
}

count=0
while [ "${count}" -le 3 ]; do
    change_master
    count=$[${count}+1]
    sleep 10
done
