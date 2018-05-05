#!/bin/bash
# File:    ~/SysReinstall/2right_input.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[31;1m ****************************************** \033[0m"
echo -e "\033[31;1m *************right management************* \033[0m"
echo "$USER ALL=(ALL:ALL) NOPASSWD : ALL" | sudo tee -a /etc/sudoers 1> /dev/null


echo -e "\033[31;1m *************bash自定义设置************* \033[0m"
(echo "
#pipi add
alias vi='vim'
alias ssu='sudo su'
#alias cp='cp -i'
#alias mv='mv -i'
alias rm='rm -i'
#alias ga='git add . ; find . -size +50M ! -path *git* | xargs git reset HEAD'
alias ga='find . -size +100M ! -path *git* | cut -c 3- > .gitignore; git add .'
alias gs='git status'
alias gc='git commit -m 'update''
alias gp='git push'
alias activate='. ~/ENV/ubuntu_env/bin/activate'
alias activatepy2='. ~/ENV/py2_env/bin/activate'
#alias orange='activate; python3 -m Orange.canvas &'
alias orange 'python3 -m Orange.canvas &'
") >> ~/.bashrc 1> /dev/null


echo -e "\033[31;1m *************input management************* \033[0m"
echo -e "\033[31;1m ********设置补全大小写不敏感*********** \033[0m"
echo "set completion-ignore-case on" | tee -a ~/.inputrc 1> /dev/null

read -p "其它配置？ y/n: " install_comfirm
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    echo -e "\033[31;1m *******设置gedit打开中文不乱码*********** \033[0m"
    gsettings set org.gnome.gedit.preferences.encodings candidate-encodings "['CURRENT', 'UTF-8', 'GB18030', 'ISO-8859-15', 'UTF-16']"
    echo -e "\033[31;1m ********安装fcitx五笔************ \033[0m"
    sudo add-apt-repository -y ppa:fcitx-team/stable
    sudo apt-get update 1> /dev/null 
    sudo apt-get install -y fcitx-table-wbpy 1> /dev/null
    echo -e "\033[33;1m语言选项中选择fcitx, 在loging out后执行以下操作配置输入法\033[0m"
    echo -e "\033[33;1m配置输入法: 
点击fcitx键盘图标，选择configure current input method配置当前输入法
点击左下角的“+”号，添加输入法，在弹出来的窗口中去掉“Only Show Current Language”的勾选，搜索添加WubiPinyin or Pinyin
下面两个现在好像是默认的了：
在选项global config > trigle input method:lshift; rshift
选中切换状态时提交: extra key for trigger input method; output > commit when toggle state
设置字体和皮肤
\033[0m"
    echo -e "\033[33;m logout?(ctrl+t cancle) \033[0m"
    read 
    echo -e "\033[33;m logouting... \033[0m"
    dbus-send --session --type=method_call --print-reply --dest=org.gnome.SessionManager /org/gnome/SessionManager org.gnome.SessionManager.Logout uint32:1
fi
echo -e "\033[31;1m ****************************************** \033[0m"

