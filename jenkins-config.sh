# jenkins set env
# ssh_ip ssh_port ssh_user ssh_password ssh_hostname
ssh_ip=${remote_ip}
ssh_port=${remote_port}
ssh_user=${remote_user}
ssh_password=${remote_password}
ssh_hostname=${remote_hostname}
api_server_name=${api_server}
k8s_service_first_ip="172.30.0.1"
k8s_service_subnet="172.30.0.0/16"
k8s_pod_subnet="172.31.0.0/16"
k8s_resources_dir=install/kubeadm/kubernetes-site/${api_server_name}
deploy_method=${method}


# clone code to local
git clone git@git.sxkj.local:data-arch/data-arch-pangu.git
cd data-arch-pangu

# Warning: prompt you what you are doing.
echo ${deploy_method} 
echo -e "Do you really want to do this?\n Wait 20s, then it will begin" 
sleep 20

# copy jenkins pub key to the remote host
grep -q ${ssh_ip} /var/lib/jenkins/.ssh/known_hosts || bash install/kubeadm/sshAutoCopy.sh $ssh_ip $ssh_port $ssh_user $ssh_password

# Install docker to the remove host
scp install/kubeadm/install-docker.sh ${ssh_user}@${ssh_ip}:/tmp
ssh ${ssh_user}@${ssh_ip} '[ -x "/usr/bin/docker" ] || bash /tmp/install-docker.sh'


# install kubernetes
ssh ${ssh_user}@${ssh_ip} "grep -q ${ssh_ip} /etc/hosts || echo ${ssh_ip} ${ssh_hostname} >> /etc/hosts"
ssh ${ssh_user}@${ssh_ip} "hostnamectl set-hostname ${ssh_hostname}"
scp install/kubeadm/install-kubernetes.sh ${ssh_user}@${ssh_ip}:/tmp
ssh ${ssh_user}@${ssh_ip} '[ -x "/usr/bin/kubelet" ] || bash /tmp/install-kubernetes.sh'


first_deploy(){
    # generate certs for remote host
    scp install/kubeadm/genCertificates.sh ${ssh_user}@${ssh_ip}:/tmp
    ssh ${ssh_user}@${ssh_ip} "bash /tmp/genCertificates.sh ${ssh_ip} ${ssh_hostname} ${api_server_name} ${k8s_service_first_ip}"
    
    
    # create the frist k8s master
    scp install/kubeadm/gen-kubeadm-init-file.sh ${ssh_user}@${ssh_ip}:/tmp
    ssh ${ssh_user}@${ssh_ip} "bash /tmp/gen-kubeadm-init-file.sh ${ssh_hostname} ${api_server_name} ${k8s_service_subnet} ${k8s_pod_subnet}"
    ssh ${ssh_user}@${ssh_ip} "systemctl is-enabled kubelet || systemctl enable kubelet"
	[ -d "${k8s_resources_dir}" ] || mkdir ${k8s_resources_dir}
    ssh ${ssh_user}@${ssh_ip} "kubeadm init --config=/tmp/init.yaml"  | grep -o "kubeadm join.*" > ${k8s_resources_dir}/kube-join-config.txt
      
	# copy cert from remote and upload to gitlab
	[ -d "${k8s_resources_dir}/pki/etcd" ] || mkdir ${k8s_resources_dir}/pki/etcd -pv
	scp -pr ${ssh_user}@${ssh_ip}:/etc/kubernetes/pki/ca.{crt,key} ${k8s_resources_dir}/pki/
	scp -pr ${ssh_user}@${ssh_ip}:/etc/kubernetes/pki/sa.{key,pub} ${k8s_resources_dir}/pki/
	scp -pr ${ssh_user}@${ssh_ip}:/etc/kubernetes/pki/front-proxy-ca.{crt,key} ${k8s_resources_dir}/pki/
	scp -pr ${ssh_user}@${ssh_ip}:/etc/kubernetes/pki/etcd/ca.{crt,key} ${k8s_resources_dir}/pki/etcd
	scp -pr ${ssh_user}@${ssh_ip}:/etc/kubernetes/admin.conf ${k8s_resources_dir}/pki/
	git add ${k8s_resources_dir}
	if $(git commit -m "add ${k8s_resources_dir} resources"); then
		echo "commited"
	else
		echo "nothing to commited"
	fi
	git push
	
    
    # create k8s network plugins
    scp install/kubeadm/weave-net-custom.yaml ${ssh_user}@${ssh_ip}:/tmp
    ssh ${ssh_user}@${ssh_ip} 'mkdir -p $HOME/.kube' 
    ssh ${ssh_user}@${ssh_ip} 'cp -pri /etc/kubernetes/admin.conf $HOME/.kube/config'
    ssh ${ssh_user}@${ssh_ip} "kubectl apply -f /tmp/weave-net-custom.yaml"
}


add_master(){
    # copy certs to remote host
	scp -pr ${k8s_resources_dir}/pki/ ${ssh_user}@${ssh_ip}:/etc/kubernetes/
	ssh ${ssh_user}@${ssh_ip} "mv /etc/kubernetes/pki/admin.conf /etc/kubernetes/"
    scp install/kubeadm/genCertificates.sh ${ssh_user}@${ssh_ip}:/tmp
	ssh ${ssh_user}@${ssh_ip} "bash /tmp/genCertificates.sh ${ssh_ip} ${ssh_hostname} ${api_server_name} ${k8s_service_first_ip}"
	join_cmd=$(cat ${k8s_resources_dir}/kube-join-config.txt)
	ssh ${ssh_user}@${ssh_ip} "${join_cmd} --experimental-control-plane"
    ssh ${ssh_user}@${ssh_ip} 'mkdir -p $HOME/.kube' 
    ssh ${ssh_user}@${ssh_ip} 'cp -pr /etc/kubernetes/admin.conf $HOME/.kube/config'
}

add_node(){
    # join a node to the k8s
	ssh ${ssh_user}@${ssh_ip} "systemctl is-enabled kubelet || systemctl enable kubelet"
	join_cmd=$(cat ${k8s_resources_dir}/kube-join-config.txt)
	ssh ${ssh_user}@${ssh_ip} "${join_cmd}"
}

get_k8s_status(){
	# get kubernetes status
	ssh ${ssh_user}@${ssh_ip} 'kubectl get pod -n kube-system'
    sleep 60
    ssh ${ssh_user}@${ssh_ip} 'kubectl get pod -n kube-system'
}

main(){
	if $(echo ${deploy_method} | grep -q first);then
    	systemctl status kubelet || first_deploy
        get_k8s_status
    elif $(echo ${deploy_method} | grep -q 'Add a master'); then		
    	systemctl status kubelet || add_master
    elif $(echo ${deploy_method} | grep -q 'Add a node'); then
    	systemctl status kubelet || add_node
    fi
}

main
