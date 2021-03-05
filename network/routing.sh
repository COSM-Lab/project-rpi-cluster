#!/bin/bash
sudo iptables -F
sudo iptables -t nat -A POSTROUTING -o eno3 -j MASQUERADE
sudo iptables -A FORWARD -i eno3 -o enp8s0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i eno3 -o enp8s0 -j ACCEPT
sudo iptables -A OUTPUT -o eno3 -p tcp --dport 5938 -m state --state NEW -j ACCEPT
#iptables-save > /etc/sysconfig/iptables
#iptables-restore < /etc/sysconfig/iptables
#sudo service iptables save
sudo systemctl restart network
