#!/bin/bash
# File:    ~/SysReinstall/9sys.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[31;1m ************************************** \033[0m"
echo -e "\033[31;1m ************手动设置项**************** \033[0m"
echo -e "\033[31;1m ******stratup_programs: goldendict shutter cairo-dock guake**** \033[0m"
stratup_programs=$(echo "goldendict shutter cairo-dock guake")
echo -e "\033[31;1m ************手动设置项**************** \033[0m"
echo -e "\033[31;1m ************************************** \033[0m"

echo -e "\033[31;1m ************************************ \033[0m"
echo -e "\033[31;1m ************系统设置**************** \033[0m"

echo -e "\033[31;1m ************设置开机启动项**************** \033[0m"
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop   #显示被隐藏的开机启动应用程序
mkdir -p ~/.config/autostart/
for app in $stratup_programs  
do  
    cat ./startup/example.desktop | sed "s:example:$app:g" > ~/.config/autostart/$app.desktop 
done
#或者也可以在Dash中搜索打开Startup Applications工具

echo -e "\033[33;1m *******设置tty启动欢迎界面******** \033[0m"
cat ./startup/issue | sudo tee -a /etc/issue 1> /dev/null
#cat ./startup/issue | sudo tee -a /etc/update-motd.d/00-header 1> /dev/null
echo -e "\033[33;1m *******设置系统开机欢迎界面******** \033[0m"
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT/#GRUB_CMDLINE_LINUX_DEFAULT/g' /etc/default/grub
sudo sed -i '14a GRUB_CMDLINE_LINUX_DEFAULTi=`cat /home/pipi/SysReinstall/scripts/startup/issue`' /etc/default/grub
sudo update-grub 1> /dev/null

echo -e "\033[31;1m ************系统设置**************** \033[0m"
echo -e "\033[31;1m ************************************* \033[0m"

