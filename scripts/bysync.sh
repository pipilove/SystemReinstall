#!/bin/sh
# File:    ~/SysReinstall/scripts/bysync.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[33;1m *********git备份的目录********* \033[0m"
cd ~/SysReinstall
echo -e "\033[33;1m *********git add .************* \033[0m"
git add .
echo -e "\033[33;1m ******git commit -m 'update'****\033[0m"
git status
git commit -m 'update'
echo -e "\033[33;1m ***********git push************* \033[0m"
git push

echo -e "\033[33;1m ***********自定义要备份的目录********* \033[0m"
DIRS=$(echo ~/SysReinstall/scripts ~/files/DESKTOP/)



echo -e "\033[33;1m ************************************ \033[0m"
echo -e "\033[33;1m ************百度云盘自动同步************ \033[0m"
DATE=`date +%F`
DATE_YEAR=`date +%Y`
DATE_MONTH=`date +%m`
bypy mkdir $DATE_YEAR/$DATE_MONTH/

cd /tmp 
for DIR in $DIRS
do
    tar -czf $(basename $DIR).tar.gz $DIR
    echo -e "\033[33;1m *****上传$DIR****** \033[0m"
    #bypy mkdir $DATE_YEAR/$DATE_MONTH/$(basename $DIR)
    bypy -v upload $(basename $DIR).tar.gz $DATE_YEAR/$DATE_MONTH
    rm -f $(basename $DIR).tar.gz
    #bypy -v syncup $DATE_YEAR/$DATE_MONTH/$(basename $DIR)
done
bypy list

echo -e "\033[33;1m **********百度云盘自动同步完成********** \033[0m"
echo -e "\033[33;1m ************************************ \033[0m"

