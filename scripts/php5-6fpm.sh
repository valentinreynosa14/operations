!#/bin/bash

#Commands
clear


sudo apt update

#Install repo for php5.6
sudo add-apt-repository -y ppa:ondrej/php

sudo apt install php5.6-fpm
sudo apt clean && sudo apt autoclean
