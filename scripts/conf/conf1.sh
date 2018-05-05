#!/bin/bash
# File: conf1.sh
# Author:  pipi
# Email: pipisorry@126.com
################# 1 #####################
export USER=pika
export host=192.168.0.172
ssh-copy-id $USER@$host
scp -r ~/SysReinstall/scripts/* $USER@$host:/home/$USER/SysReinstall/scripts
scp -r ~/SysReinstall/install/* $USER@$host:/home/$USER/SysReinstall/install
##转到conf.sh 2##
################## 2 ####################
bash 2right_input.sh

