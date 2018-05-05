#!/bin/bash
# File:    ~/SysReinstall/scripts/7aptinstall.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[33;1m ******************************* \033[0m"
echo -e "\033[33;1m ********手动设置*************** \033[0m"
echo -e "\033[33;1m *****envfilename=~/.bashrc******** \033[0m"
export envfilename=~/.bashrc
OPT=~/opt
echo -e "\033[33;1m ********手动设置*************** \033[0m"
echo -e "\033[33;1m ******************************* \033[0m"


echo -e "\033[33;1m ******************************* \033[0m"
echo -e "\033[33;1m *********常用软件安装********** \033[0m"

echo -e "\033[33;1m *********apt-get update************** \033[0m"
sudo apt-get update 1> /dev/null
test -d ~/opt || mkdir -p ~/opt

echo -e "\033[33;1m *********更新pip和安装pip3********** \033[0m"
sudo apt install -y python3-pip 1> /dev/null
#pip install --upgrade pip
pip3 install --upgrade pip 1> /dev/null

echo -e "\033[33;1m ************安装和配置dtags********** \033[0m"
sudo pip3 install dtags 1> /dev/null
#echo "command -v dtags > /dev/null 2>&1 && . <(dtags shell bash)" >> $envfilename
echo "command -v dtags-activate > /dev/null 2>&1 && eval \"\`dtags-activate bash\`\"" >> $envfilename
. $envfilename
t ~/files/mine/python_workspace
t ~/ENV/ubuntu_env
t ~/SysReinstall/scripts
t ~/Desktop
echo -e "\033[33;1m **********安装断行转换dos2unix & unix2dos********** \033[0m"
sudo apt-get install -y dos2unix
echo -e "\033[33;1m ******************************* \033[0m"


echo -e "\033[33;1m *******安装git************ \033[0m"
sudo add-apt-repository -y ppa:git-core/ppa 1> /dev/null
sudo apt-get update 1> /dev/null
sudo apt-get install -y git
echo -e "\033[33;1m *******配置git************ \033[0m"
git config --global user.name "pipi"
git config --global user.email "pipisorry@126.com"
git config http.postBuffer 524288000
sudo apt-get install -y meld
git config --global diff.tool.meld
git config --global merge.tool meld
echo -e "\033[33;1m安装git-lfs\033[0m"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfsv 1> /dev/null
#find . -size +100M ! -path "*git*" | xargs git lfs track
#git add .
#git commit -m "update"
#git push -u origin master
echo -e "\033[33;1m ******************************* \033[0m"



echo -e "\033[33;1m *******办公******** \033[0m"
echo -e "\033[33;1m *******安装wiznote******** \033[0m"
sudo add-apt-repository -y ppa:wiznote-team 1> /dev/null
sudo apt-get update 1> /dev/null
sudo apt-get install -y wiznote
echo -e "\033[33;1m *********安装unrar*********** \033[0m"
#echo -e "\033[33;1m sudo apt-get install -y p7zip-full \033[0m"
#sudo apt-get install -y p7zip-full
#echo -e "\033[33;1m sudo apt-get install -y unrar \033[0m"
sudo apt-get install -y unrar
echo -e "\033[33;1m *********安装emacs*********** \033[0m"
#sudo add-apt-repository -y ppa:ubuntu-elisp/ppa 1> /dev/null
#sudo apt-get update 1> /dev/null
#sudo apt-get install -y emacs-snapshot emacs-snapshot-el 1> /dev/null
#http://wikemacs.org/wiki/Installing_Emacs_on_GNU/Linux#Emacs_24_2
echo -e "\033[33;1m ********安装词典goldendict*********** \033[0m"
sudo apt-get install -y goldendict 1> /dev/null
tar -zxf ../install/stardict.tar.gz -C ~/opt
goldendict &
echo -e "\033[33;1m ***********配置golddict: dict, sound, youdao:http://dict.youdao.com/search?le-eng&q=%GDWORD% ,start close to tray************** \033[0m"
echo -e "\033[33;1m ***********安装百度云同步bypy************** \033[0m"
#sudo pip3 install requests 1> /dev/null
#sudo pip3 install bypy 1> /dev/null
#定时
#echo '00 19 * * 3 . ~/SysReinstall/scripts/bysync.sh' | sudo tee -a /var/spool/cron/crontabs/$USER 1> /dev/null
#sudo pip3 install certifi
#sudo pip3 install urllib3[secure]
#(echo "import certifi
#import urllib3
#http = urllib3.PoolManager(cert_reqs='CERT_REQUIRED', ca_certs=certifi.where())") | python3
echo -e "\033[33;1m ***********安装Teamviewer************** \033[0m"
#https://www.teamviewer.com/zhcn/download/linux/
wget https://downloadus1.teamviewer.com/download/version_11x/teamviewer_11.0.67687_i386.deb -P $OPT
xdg-open $OPT/teamviewer*.deb &
echo -e "\033[33;1m ******************************* \033[0m"



echo -e "\033[33;1m ***********界面************ \033[0m"
echo -e "\033[33;1m ***********安装guake F12激活************** \033[0m"
#sudo apt-get install -y guake 1> /dev/null
echo -e "\033[33;1m *********点击启动器图标让程序窗口最小化*********** \033[0m"
#sudo add-apt-repository -y ppa:freyja-dev/unity-tweak-tool-daily 1> /dev/null
#sudo apt-get update 1> /dev/null
#sudo apt-get install -y unity-tweak-tool 1> /dev/null
#unity-tweak-tool &
echo -e "\033[33;1m ***********设置launcher, cursors, fonts, hotcorner************ \033[0m"
echo -e "\033[33;1m *********安装cairo-dock桌面视觉效果*********** \033[0m"
sudo apt-get install -y cairo-dock cairo-dock-plug-ins 1> /dev/null
echo -e "\033[33;1m ******************************* \033[0m"



echo -e "\033[33;1m *********图形处理*********** \033[0m"
echo -e "\033[33;1m *********屏幕取色器*********** \033[0m"
sudo apt-get install -y gcolor2         #or gpick, 其实guakepreference设置中就有这个功能
echo -e "\033[33;1m ***********安装Shutter************** \033[0m"
sudo add-apt-repository -y ppa:shutter/ppa 1> /dev/null
sudo apt-get update 1> /dev/null
sudo apt-get install -y shutter 1> /dev/null
#echo -e "\033[33;1m *******安装gpaint（可使用shutter代替）************* \033[0m"
sudo apt-get install -y gpaint

echo -e "\033[33;1m *********reboot?(ctrl+c cancel)************* \033[0m"
read
sudo reboot
echo -e "\033[33;1m ******************************* \033[0m"

