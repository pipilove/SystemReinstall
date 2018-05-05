#!/bin/bash
# File: .sh
# Author:  pipi
# Email: pipisorry@126.com
echo -e "\033[31;1m *********************************** \033[0m"
echo -e "\033[31;1m *************手动配置************* \033[0m"
#https://www.jetbrains.com/idea/#chooseYourEdition
IDEA_URL='https://download.jetbrains.8686c.com/idea/ideaIU-2016.2.5.tar.gz'
OPT=~/opt
echo -e "\033[31;1m *********************************** \033[0m"


echo -e "\033[33;1m ****************配置intelliJ IDEA**************** \033[0m"
read -p "配置IDEA? y/n: " install_comfirm
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    test -f ../install/ideaIU*tar.gz || wget $IDEA_URL -P ../install
    tar -xzf ../install/ideaIU-*tar.gz -C $OPT
    echo -e "\033[31;1m **********启动IDEA********** \033[0m"
    $OPT/idea*/bin/idea.sh &
fi
echo -e "\033[31;1m *********************************** \033[0m"

