#!/etc/bin/bash
# File:    ~/SysReinstall/scripts/3ssh.sh
# Author:  pipi
# Email: pipisorry@126.com


#配置ssh#
echo -e "\033[31;1m ******************************* \033[0m"
echo -e "\033[31;1m ************安装和配置ssh************ \033[0m"
sudo apt-get install -y openssh-server openssh-client 1> /dev/null
sudo sed -i 's/UsePAM no/UsePAM yes/g' /etc/ssh/sshd_config
sudo sed -i '8a /etc/init.d/ssh start' /etc/profile
sudo /etc/init.d/ssh start
ps -e | grep ssh

echo -e "\033[31;1m ssh授权 \033[0m"
cd ~/.ssh/
ssh-keygen -t rsa
cat ./id_rsa.pub >> ./authorized_keys
echo -e "\033[31;1m ************安装和配置ssh************ \033[0m"
echo -e "\033[31;1m ******************************* \033[0m"

