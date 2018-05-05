#！/bin/bash
# File:    ~/SysReinstall/scripts/4synchronization.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[31;1m *********************************** \033[0m"
echo -e "\033[31;1m *************手动配置************* \033[0m"
#https://github.com/syncthing/syncthing/releases
echo -e "\033[31;1m SYNC_URL=https://github.com/syncthing/syncthing/releases/download/v0.14.6/syncthing-linux-amd64-v0.14.6.tar.gz \033[0m"
SYNC_URL=https://github.com/syncthing/syncthing/releases/download/v0.14.6/syncthing-linux-amd64-v0.14.6.tar.gz
echo -e "\033[31;1m *************手动配置************* \033[0m"
echo -e "\033[31;1m *********************************** \033[0m"


echo -e "\033[31;1m *********************************** \033[0m"
echo -e "\033[31;1m *************syncthing************* \033[0m"
echo -e "\033[31;1m test -d ~/opt || mkdir -p ~/opt \033[0m"
test -d ~/opt || mkdir -p ~/opt
cd ~/opt
#wget $SYNC_URL
tar xzf syncthing-linux-amd64-*.tar.gz
cd syncthing-linux-amd64-*/
echo -e "\033[31;1m sudo cp syncthing /usr/local/bin/ \033[0m"
sudo cp syncthing /usr/local/bin/
echo -e "\033[31;1m sed -i 's/127.0.0.1:8080/0.0.0.0:8080/g' ~/.config/syncthing/config.xml \033[0m"
sed -i 's/127.0.0.1:8080/0.0.0.0:8080/g' ~/.config/syncthing/config.xml
echo -e "\033[31;1m syncthing \033[0m"
syncthing
#http://localhost:8080
echo -e "\033[31;1m *************syncthing************* \033[0m"
echo -e "\033[31;1m *********************************** \033[0m"

