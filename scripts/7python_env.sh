#!/bin/bash
# File:    ~/SysReinstall/scripts/5python_env.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[31;1m *********************************** \033[0m"
echo -e "\033[31;1m *************手动配置************* \033[0m"
echo "https://www.jetbrains.com/pycharm/download/#section=linux"
echo "https://www.anaconda.com/download/#download"

export PYCHARM_URL=https://download.jetbrains.8686c.com/python/pycharm-professional-2018.1.2.tar.gz
ldconfig
#获得word和long的位数，64位系统中应该分别得到32和64
if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ] ; then
    export ANACONDA_URL=https://repo.anaconda.com/archive/Anaconda3-5.1.0-Linux-x86_64.sh
    export ANACONDA_file=Anaconda3-*-Linux-x86_64.sh
else
    export ANACONDA_URL=https://repo.anaconda.com/archive/Anaconda3-5.1.0-Linux-x86.sh
    export ANACONDA_file=Anaconda3-*-Linux-x86.sh
fi

export ENV=~/ENV
#export python_workspace=~/files/mine/python_workspace
export install_dir=/tmp/install

export login=pipi
export host=192.168.0.172
echo -e "\033[31;1m *********************************** \033[0m"

echo -e "\033[31;1m mkdirs \033[0m"
#test -d $python_workspace || mkdir -p $python_workspace
test -d $install_dir || mkdir -p $install_dir
test -d $ENV || mkdir -p $ENV


echo -e "\033[31;1m *********************************** \033[0m"
echo -e "\033[33;1m *************配置python virtualenv************* \033[0m"
read -p "配置python env? y/n: " install_comfirm
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    sudo apt-get update 1> /dev/null
    sudo apt install -y python3-pip 1> /dev/null
    pip3 install --upgrade pip 1> /dev/null

    echo -e "\033[31;1m install & config virtualenv \033[0m"
    sudo pip3 install virtualenv 1> /dev/null
    cp requirements.txt $ENV
    cd $ENV

    read -p "配置python2 env? y/n: " install_comfirm
    if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
        virtualenv --no-site-packages --always-copy --python=/usr/bin/python py2_env
        . py2_env/bin/activate
        sed -i 's/==.*$//g' requirements.txt
        echo -e "\033[33;1m pip install -r requirements.txt \033[0m"
        sudo apt-get install -y python3-tk #matplotlib dependency
        pip install -r requirements.txt
    fi

    read -p "配置python3 env? y/n: " install_comfirm
    if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
        virtualenv --no-site-packages --always-copy ubuntu_env
        . ubuntu_env/bin/activate
        sed -i 's/==.*$//g' requirements.txt
        echo -e "\033[33;1m pip install -r requirements.txt \033[0m"
        pip install -r requirements.txt
    fi
fi
echo -e "\033[33;1m *********************************** \033[0m"


echo -e "\033[31;1m *********************************** \033[0m"
echo -e "\033[33;1m *************配置python anocanda************* \033[0m"
echo -e "\033[33;1m *************注意不要一直enter，最好设置一下PREFIX=~/ENV/anaconda3 及将路径加入.bashrc************* \033[0m"
read -p "配置python anaconda3? y/n: " install_comfirm
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
#    sudo apt-get update
   # 1> /dev/null
    test -f $install_dir/$ANACONDA_file && install_comfirm=n || install_comfirm=y
    if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
        wget $ANACONDA_URL -P $install_dir  
    fi
    bash $install_dir/$ANACONDA_file
    . ~/.bashrc
fi
echo -e "\033[33;1m *********************************** \033[0m"


echo -e "\033[33;1m ****************配置pycharm**************** \033[0m"
echo -e "\033[31;1m *******要先配置java_config.sh(JAVA_HOME有输出就可以)****** \033[0m"
read -p "配置pycharm? y/n: " install_comfirm
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    test -d ~/opt/ || mkdir ~/opt
    test -f $install_dir/pycharm-professional*tar.gz && install_comfirm=n || install_comfirm=y
    if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
        wget $PYCHARM_URL -P $install_dir/
    fi
    tar -zxf $install_dir/pycharm-professional*tar.gz -C ~/opt
    ~/opt/pycharm*/bin/pycharm.sh
    echo -e "\033[33;1m *************配置python env************* \033[0m"
    echo -e "\033[31;1m *********************************** \033[0m"
fi
echo -e "\033[33;1m ****************************************** \033[0m"


echo -e "\033[31;1m ********************************************** \033[0m"
echo -e "\033[31;1m *************python remote env配置************ \033[0m"
#read -p "配置python remote env? y/n: " install_comfirm
install_comfirm='n'
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    echo -e "\033[31;1m ssh-copy-id $login@$host \033[0m"
    ssh-copy-id $login@$host
    echo -e "\033[31;1m 使用scp -r datasetdir/ piting@192.168.0.172:/media/data/pipi/datasets复制数据文件到运程服务器 \033[0m"
    #scp -r SocialNetworks/ piting@192.168.0.172:/media/data/pipi/datasets
fi
echo -e "\033[33;1m ****************************************** \033[0m"

