#!/bin/bash
# File:    ~/SysReinstall/scripts/sys_clean.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[31;1m ***********清理系统垃圾***************** \033[0m"
sudo apt-get autoclean    #清理旧版本的软件缓存
sudo apt-get clean    #清理所有软件缓存
sudo apt-get autoremove    #删除系统不再使用的孤立软件
sudo find / -name core -print -exec rm -rf {} ;    #删除core文件,某个程序出错时，系统会自动将残留在内存中的数据存成core文件

