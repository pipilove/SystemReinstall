#!/bin/bash
# File: .sh
# Author:  pipi
# Email: pipisorry@126.com
echo -e "\033[31;1m ************************************** \033[0m"
echo -e "\033[31;1m ************手动设置项**************** \033[0m"
echo -e "\033[31;1m **http://www.riverbankcomputing.com/software/sip/download** \033[0m"
echo -e "\033[31;1m ***https://riverbankcomputing.com/software/pyqt/download*** \033[0m"
export SIP_URL=https://sourceforge.net/projects/pyqt/files/sip/sip-4.18.1/sip-4.18.1.tar.gz
export PYQT4_URL=http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.4/PyQt-x11-gpl-4.11.4.tar.gz
export VIRENV=~/ENV/ubuntu_env
#export PYTHON_PATH=$VIRENV/bin/python
export PYTHON_PATH=python3
export OPT=~/opt
echo -e "\033[31;1m ************************************** \033[0m"


echo -e "\033[31;1m *****进入虚拟环境****** \033[0m"
. $VIRENV/bin/activate
echo -e "\033[31;1m ************************************** \033[0m"


echo -e "\033[31;1m ************************************** \033[0m"
echo -e "\033[31;1m ************安装pyqt4依赖sip************* \033[0m"
test -f ../install/sip-*tar.gz || wget $SIP_URL -P ../install
test -d $OPT/sip* && rm -rf $OPT/sip*
tar -zxf ../install/sip-*tar.gz -C $OPT 1> /dev/null
cd $OPT/sip*
$PYTHON_PATH configure.py
#$PYTHON_PATH configure.py --incdir=$VIRENV/include/python
echo -e "\033[31;1m **************make************************ \033[0m"
make 1> /dev/null
echo -e "\033[31;1m *****************make install********************* \033[0m"
sudo make install 1> /dev/null
cd -
echo -e "\033[31;1m ************************************** \033[0m"


echo -e "\033[31;1m ************************************** \033[0m"
echo -e "\033[31;1m *************安装pyqt4其它依赖*********** \033[0m"
sudo apt-get install -y qt4-qmake 1> /dev/null
sudo apt-get install -y libqt4-dev 1> /dev/null
sudo apt-get install -y libqtwebkit-dev 1> /dev/null
echo -e "\033[31;1m ************************************** \033[0m"


echo -e "\033[31;1m ************************************** \033[0m"
echo -e "\033[31;1m ************安装pyqt4*************** \033[0m"
test -f ../install/PyQt-x11-gpl-4*.tar.gz || wget $PYQT4_URL -P ../install
test -f $OPT/PyQt* && rm -rf $OPT/PyQt*
tar -zxf ../install/PyQt-x11-gpl-4*.tar.gz -C $OPT 1> /dev/null

cd $OPT/PyQt*
$PYTHON_PATH configure-ng.py --qmake /usr/bin/qmake-qt4
#sudo $PYTHON_PATH configure.py --verbose
echo -e "\033[31;1m **************make************************ \033[0m"
make 1> /dev/null
echo -e "\033[31;1m *****************make install********************* \033[0m"
sudo make install 1> /dev/null
cd -
echo -e "\033[31;1m ************************************** \033[0m"
echo -e "\033[31;1m ************************************** \033[0m"

