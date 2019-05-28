#!/bin/sh
FW="/sbin/iptables"
ALLOW_SERVERS="/data/firewall/IP_ALLOWED.txt"
# Flush old rules, old custom tables
$FW --flush
$FW --delete-chain
# Set default policies for all three default chains
$FW -P INPUT DROP
$FW -P FORWARD DROP
$FW -P OUTPUT ACCEPT
# Enable free use of loopback interfaces
$FW -A INPUT -i lo -j ACCEPT
$FW -A OUTPUT -o lo -j ACCEPT
# All TCP sessions should begin with SYN
$FW -A INPUT -p tcp ! --syn -m state --state NEW -s 0.0.0.0/0 -j DROP
# Accept inbound TCP packets
$FW -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# block any traffic from abusers
$FW -N sshguard
$FW -A INPUT -j sshguard
$FW -A INPUT -m multiport -p tcp --destination-ports 21,22 -j sshguard
# Accept any inbound from all servers
for IP in $(cat $ALLOW_SERVERS); do $FW -A INPUT -s $IP -j ACCEPT; done
# Accept inbound services public traffic
$FW -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
$FW -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
# Accept inbound ICMP messages
$FW -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
$FW -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
$FW -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
$FW -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
$FW -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
# Log drop traffic
$FW -N LOGGING
$FW -A INPUT -j LOGGING
$FW -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "IPTables-Dropped: " --log-level 4
$FW -A LOGGING -j DROP
exit 0

