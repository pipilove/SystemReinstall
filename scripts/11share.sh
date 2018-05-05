#!/bin/bash
# File:    ~/SysReinstall/scripts/4share.sh
# Author:  pipi
# Email: pipisorry@126.com

#手动配置#
echo -e "\033[31;1m *********************************** \033[0m"
echo -e "\033[31;1m *************手动配置************* \033[0m"
echo -e "\033[31;1m wget export client=pika \033[0m"
export client=pika
echo -e "\033[31;1m *************手动配置************* \033[0m"
echo -e "\033[31;1m *********************************** \033[0m"


echo -e "\033[31;1m *************安装和配置samba************* \033[0m"
sudo apt-get update 1> /dev/null
sudo apt install -y samba 1> /dev/null
sudo apt install -y cifs-utils 1> /dev/null
echo -e "\033[31;1m sudo smbpasswd -a $USER \033[0m"
sudo smbpasswd -a $USER

echo -e "\033[31;1m sudo ufw disable \033[0m"
sudo ufw disable
sudo /etc/init.d/smbd start
echo "sudo /etc/init.d/samba start" >> ~/.bashrc 1> /dev/null
#sudo vim /etc/samba/smb.conf


echo -e "\033[31;1m ************************************* \033[0m"
echo -e "\033[31;1m *************安装和配置synergy（ctrl+c cancel）************* \033[0m"
read
echo -e "\033[31;1m sudo apt-get install synergy \033[0m"
sudo apt-get install -y synergy
echo -e "\033[31;1m sudo apt-get install quicksynergy \033[0m"
sudo apt-get install -y quicksynergy

echo -e "\033[31;1m touch ~/.synergy.conf \033[0m"
touch ~/.synergy.conf
echo -e "\033[31;1m (echo section: screens...) > ~/.synergy.conf \033[0m"
(echo "section: screens
        $(hostname):
        $client:
end
section: links
        $client:
                right = $(hostname)
        $(hostname):
                left = $client
end
") > ~/.synergy.conf
echo -e "\033[31;1m synergys \033[0m"
#synergys
synergy
#或者在dash中查找synergys
echo -e "\033[31;1m 手动配置synergys \033[0m"
echo -e "\033[31;1m *************配置synergy************* \033[0m"
echo -e "\033[31;1m ************************************* \033[0m"

