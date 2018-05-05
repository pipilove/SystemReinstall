#!/bin/bash
# File:    ~/SysReinstall/scripts/3vim.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[31;1m ************************************************ \033[0m"
echo -e "\033[31;1m *************手动设置项************ \033[0m"
echo -e "\033[31;1m *********export ycm_path_to_python_interpreter=...********* \033[0m"
echo export VIRTUAL_ENV=~/ENV/ubuntu_env >> ~/.profile; . ~/.profile
export python_interpreter=/usr/bin/python3
#export python_interpreter=$VIRTUAL_ENV/bin/python
echo -e "\033[31;1m ************************************************ \033[0m"


echo -e "\033[31;1m ************************************************ \033[0m"
echo -e "\033[31;1m *************vim install & settings************* \033[0m"

read -p "install vim & vim-gnome? y/n: " install_comfirm
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    sudo apt-get update 1> /dev/null
    sudo apt-get install -y vim 1> /dev/null
    sudo apt-get install -y vim-gnome 1> /dev/null
fi




#http://vim-scripts.org#
read -p "continue config vim with bundles? y/n: " config_comfirm
if [ $config_comfirm = 'y' -o $config_comfirm = 'Y' -o $config_comfirm = 'yes' ]; then

    sim_config_comfirm=$(echo no)
    #read -p "continue simply config vim? y/n: " sim_config_comfirm
    if [ $sim_config_comfirm = 'y' -o $sim_config_comfirm = 'Y' -o $sim_config_comfirm = 'yes' ]; then
        test -f ~/.vimrc && rm -f ~/.vimrc
        test -f ~/.vimrc || cp ./vim_config/vimrc ~/.vimrc
        sed -i 's:$python_interpreter:'$python_interpreter':g' ~/.vimrc
    fi

    echo -e "\033[31;1m *****************git checking*********************** \033[0m"
    git --version
    if [ $? != 0 ]; then
        echo -e "\033[33;1m installing git \033[0m"
        sudo add-apt-repository -y ppa:git-core/ppa
        sudo apt-get update 1> /dev/null
        sudo apt-get install -y git
        echo -e "\033[33;1m git config \033[0m"
        git config --global user.name "pipi"
        git config --global user.email "pipisorry@126.com"
    fi    
    
    test -d ~/.vim && sudo chown -R pipi:pipi ~/.vim
    test -d ~/.vim/bundle || mkdir -p ~/.vim/bundle
    #read -p "re git clone vundle bundles? y/n: " reinstall_vundle_comfirm
    reinstall_vundle_comfirm=$(echo y)
    if [ $reinstall_vundle_comfirm = 'y' -o $reinstall_vundle_comfirm = 'Y' -o $reinstall_vundle_comfirm = 'yes' ]; then
        test -d ~/.vim/bundle && rm -rf ~/.vim/bundle
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null
    fi

    echo -e "\033[31;1m *******配置vundle_setting到~/.vimrc***** \033[0m"
    (echo '0r vim_config/vundle_settings'; echo 'wq') | ed -s ~/.vimrc > /dev/null
    
    echo -e "\033[31;1m *************安装插件的系统依赖和字体******************* \033[0m"
    sudo apt-get update 1> /dev/null
    #sudo apt-get install -y wmctrl #窗口自动最大化，Linux下需要安装wmctrl
    sudo apt-get install -y ack-grep > /dev/null #ctrlsf.vim需要ack
    sudo apt-get install -y ctags > /dev/null #tagbar需要安装依赖的ctags
    sudo apt-get install -y build-essential cmake > /dev/null #Valloric/YouCompleteMe
    sudo apt-get install -y python-dev python3-dev > /dev/null #Valloric/YouCompleteMe
    git clone https://github.com/powerline/fonts.git /tmp/fonts #安装vim-powerline\vim-airline打过补丁的字体
    cd /tmp/fonts/ && . install.sh && cd -
    echo -e "\033[31;1m *************安装插件 vim +PluginInstall +qall******************* \033[0m"
    echo -e "\033[31;1m *************安装中...也可以在添加完.vimrc的的配置后，重启vim并输入命令:PluginInstall来安装插件******************* \033[0m"
    vim +PluginInstall +qall #过程有点久

    echo -e "\033[31;1m **************需要编译才能使用的插件**************** \033[0m"
    $python_interpreter ~/.vim/bundle/YouCompleteMe/install.py > /dev/null #使用python3编译YCM，这样就支持python3了
    #~/.vim/bundle/YouCompleteMe/install.py --all
    
    echo -e "\033[31;1m **************配置vim_config/plugin_config到.vimrc**************** \033[0m"
    cat vim_config/plugin_config >> ~/.vimrc
    echo -e "\033[31;1m *************set python_interpreter to YCM & F10**************** \033[0m"
    sed -i 's:$python_interpreter:'$python_interpreter':g' ~/.vimrc
    echo -e "\033[33;1m ***********如果是在终端或iterm中使用Vim，需要设置终端或iterm的字体为powerline字体才能正确显示特殊字符，如DejaVu Sans Mono for Powerline**************** \033[0m"
fi


read -p "only reconfig vim with bundles? y/n: " reconfig_comfirm
if [ $reconfig_comfirm = 'y' -o $reconfig_comfirm = 'Y' -o $reconfig_comfirm = 'yes' ]; then
    echo -e "\033[31;1m cp vimrc >> ~/.vimrc \033[0m"
    test -f ~/.vimrc && rm -f ~/.vimrc
    test -f ~/.vimrc || cp ./vim_config/vimrc ~/.vimrc
    
    (echo '0r vim_config/vundle_settings'; echo 'wq') | ed -s ~/.vimrc

    cat vim_config/plugin_config >> ~/.vimrc
    sed -i 's:$python_interpreter:'$python_interpreter':g' ~/.vimrc
fi

echo -e "\033[33;1m ***********如果是在终端或iterm中使用Vim，需要设置终端或iterm的字体为powerline字体才能正确显示特殊字符，如DejaVu Sans Mono for Powerline**************** \033[0m"
echo -e "\033[31;1m ***********vim install & settings**************** \033[0m"
echo -e "\033[31;1m ************************************************ \033[0m"

