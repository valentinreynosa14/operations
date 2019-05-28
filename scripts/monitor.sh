#!/bin/bash
##monitor implementation


clear

apt install -y xinetd 
cd /tmp/ 
wget http://monitor.wapsite.com/binbit/check_mk/agents/check-mk-agent_1.5.0p7-1_all.deb
dpkg -i check-mk-agent_1.5.0p7-1_all.deb

##fin

