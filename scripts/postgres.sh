#!/bin/bash
##Postgress 10 installation

clear

wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
apt update
apt-get install postgresql postgresql-contrib -y
#clear
#cd /home/


##fin
