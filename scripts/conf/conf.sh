#!/bin/bash
# File: conf.sh
# Author:  pipi
# Email: pipisorry@126.com
############### 1 ###################
export USER=pika
sudo useradd -m $USER
sudo passwd $USER
echo "$USER ALL=(ALL:ALL) NOPASSWD : ALL" | sudo tee -a /etc/sudoers 1> /dev/null
su $USER
cd
mkdir -p ~/SysReinstall/scripts
mkdir -p ~/SysReinstall/install
mkdir -p ~/files/mine/python_workspace/SocialNetworks
##转到conf1.sh 1##
############### 2 ###################
cd ~/SysReinstall/scripts
bash 7python_env.sh
echo -e "\033[31;1m *********配置pycharm**************** \033[0m
