#!/bin/bash
##check mk notity status

clear

apt update 
apt-get install -y nagios-plugins
mkdir -p /etc/check_mk
cd /etc/check_mk
touch mrpe.cfg
echo  "web_<notifypromos>        /usr/lib/nagios/plugins/check_http -H notifypromos.wapsite.com -u http://notifypromos.wapsite.com/api -p 80" >> mrpe.cfg


##fin

