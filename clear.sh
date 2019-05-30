#!/bin/bash
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X
ipvsadm --clear
systemctl restart docker
iptables -nvL
