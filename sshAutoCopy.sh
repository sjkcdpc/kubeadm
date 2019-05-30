#!/bin/bash 
# Author: Winthcloud
# Version: 2.2
# Date: 20181226
# ip.txt format:  IP Name Password
hostinfo=./ip.txt
ssh_port=22
copy_key=/root/.ssh/id_rsa
copy_key1=keyfile/local.pub

ssh_copy(){
	ip=$1
	port=$2
	user=$3
	password=$4
	key=$5
	expect << EOF
	set timeout 10
	spawn ssh-copy-id -p $port -i $key $user@$ip
	expect {
		"yes/no" {send "yes\n";exp_continue}
		"password" {send "$password\n"}
	}
	expect eof
EOF
#	return $?
	#[ "$?" -eq 0 ] && return 0 || return 1
}

# Initial condition
[ -f "$copy_key" ] || ssh-keygen -P '' -f $copy_key > /dev/null
rpm -qi expect > /dev/null || yum -y install expect > /dev/null

while read hostinfo;do
	hostIp=$(echo $hostinfo| awk '{print $1}')
	hostUser=$(echo $hostinfo| awk '{print $2}')
	hostPass=$(echo $hostinfo| awk '{print $3}')
	if $(ping -c 1 -W 1 $hostIp &> /dev/null);then
		ssh_copy $hostIp $ssh_port $hostUser $hostPass $copy_key &> /dev/null
		[ -f "$copy_key1" ] && ssh_copy $hostIp $ssh_port $hostUser $hostPass $copy_key1 &> /dev/null
		echo -e "\033[1;32mOK\033[0m Copy ID to $hostIp" 
	else
		echo -e "\033[1;31mEr\033[0m Copy ID to $hostIp" 
	fi
done < $hostinfo
