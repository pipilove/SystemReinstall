#!/etc/bin/bash
# File:    ~/SysReinstall/scripts/4java_config.sh
# Author:  pipi
# Email: pipisorry@126.com

#手动配置#
echo -e "\033[31;1m ********************************** \033[0m"
echo -e "\033[31;1m *************手动配置************* \033[0m"
echo -e "\033[31;1m export ENV=~/ENV \033[0m"
export ENV=~/ENV
export envfilename=~/.bashrc
export ECLIPSE_URL='http://mirrors.neusoft.edu.cn/eclipse/oomph/epp/neon/R1/eclipse-inst-linux64.tar.gz'
#https://www.eclipse.org/downloads/download.php?file=/oomph/epp/neon/R1/eclipse-inst-linux64.tar.gz
#不能通过#wget直接下载，下载网站要同意liscense，http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html, download into $install_dir
export install_dir=/tmp/install
#../install
echo -e "\033[31;1m *************手动配置************* \033[0m"
echo -e "\033[31;1m ********************************** \033[0m"


echo -e "\033[31;1m test -d $ENV || mkdir -p $ENV \033[0m"
test -d $ENV || mkdir -p $ENV
test -d $install_dir || mkdir -p $install_dir


echo -e "\033[31;1m ********************************** \033[0m"
echo -e "\033[31;1m *************配置java************* \033[0m"
test -f $ENV/jdk-* && rm -f $ENV/jdk-*
test -d $ENV/jdk* && rm -rf $ENV/jdk*

tar -zxf $install_dir/jdk-*gz -C $ENV && ln -sf $ENV/jdk*/ $ENV/jdk

echo -e "\033[31;1m set java PATH \033[0m"
echo export JAVA_HOME=$ENV/jdk | tee -a $envfilename
echo export PATH=\${JAVA_HOME}/bin:\$PATH | tee -a $envfilename
echo export JRE_HOME=\${JAVA_HOME}/jre | tee -a $envfilename
echo export CLASSPATH=.:\${JAVA_HOME}/lib:\${JRE_HOME}/lib | tee -a $envfilename
. $envfilename
echo -e "\033[31;1m java -version \033[0m"
java -version
echo -e "\033[31;1m *************配置java************* \033[0m"
echo -e "\033[31;1m ********************************** \033[0m"


#echo -e "\033[33;1m ****************配置eclipse**************** \033[0m"
#read -p "配置eclipse? y/n: " install_comfirm
install_comfirm=n
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    test -d ~/opt/ || mkdir ~/opt
    test -f $install_dir/eclipse*tar.gz && install_comfirm=n || install_comfirm=y
    #read -p "download newest eclipse? y/n: " install_comfirm
    if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    wget $ECLIPSE_URL -P $install_dir
    fi
    tar -zxf $install_dir/eclipse*tar.gz -C ~/opt
    echo -e "\033[31;1m ***选择eclipse ide for JavaEE developers进行安装*** \033[0m"
    . ~/opt/eclipse-installer/eclipse-inst
fi
echo -e "\033[33;1m ****************************************** \033[0m"

