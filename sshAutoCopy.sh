#!/bin/bash 
# Author: Winthcloud
# Version: 2.3
# Date: 20190625
# ip.txt format:  IP Name Password
hostIp=$1
ssh_port=$2
hostUser=$3
hostPass=$4
ssh_key=$HOME/.ssh/id_rsa.pub

rpm -qi expect > /dev/null || yum -y install expect > /dev/null
expect << EOF
set timeout 10
spawn ssh-copy-id -p $ssh_port -i $ssh_key $hostUser@$hostIp
expect {
	"yes/no" {send "yes\n";exp_continue}
	"password" {send "$hostPass\n"}
}
expect eof
EOF
echo -e "\033[1;32mOK\033[0m Copy ID to $hostIp" 
