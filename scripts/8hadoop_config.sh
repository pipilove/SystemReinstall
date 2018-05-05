#!/etc/bin/bash
# File:    ~/SysReinstall/scripts/6hadoop_config.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[31;1m ********************************** \033[0m"
echo -e "\033[31;1m *************手动配置************* \033[0m"
echo -e "\033[31;1m ********ENV, real_path, HADOOP_HOME, envfilename******* \033[0m"
export ENV=~/ENV
export HADOOP_URL=http://mirror.bit.edu.cn/apache/hadoop/common/stable/hadoop-2.7.3.tar.gz
export HADOOP_URL2=http://mirrors.cnnic.cn/apache/hadoop/common/stable/hadoop-2.7.3.tar.gz
export HADOOP_HOME=$ENV/hadoop
export envfilename=~/.bashrc
echo -e "\033[31;1m 之前要运行ssh.sh 和 java_config.sh !!!(ctrl+c结束此脚本) \033[0m"
echo -e "\033[31;1m *************手动配置************* \033[0m"
echo -e "\033[31;1m ********************************** \033[0m"

test -d $ENV || mkdir -p $ENV

echo -e "\033[31;1m ********************************** \033[0m"
echo -e "\033[31;1m ************配置hadoop************ \033[0m"
read -p "download newest hadoop tarball? y/n: " install_comfirm
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    test -f ../install/hadoop-* && rm -f ../install/hadoop-* ; wget $HADOOP_URL -P ../install/ || wget $HADOOP_URL2 -P ../install/
fi
test -f ../install/hadoop-* || wget $HADOOP_URL -P ../install/ || wget $HADOOP_URL2 -P ../install/
test -d $ENV/hadoop-* && rm -rf $ENV/hadoop-*
test -L $ENV/hadoop && rm -rf $ENV/hadoop
tar -zxf ../install/hadoop-* -C $ENV
ln -s $ENV/hadoop-*/ $ENV/hadoop
echo export HADOOP_HOME=$ENV/hadoop | tee -a $envfilename 1> /dev/null
echo export PATH=\$PATH:\${HADOOP_HOME}/bin:\${HADOOP_HOME}/sbin | tee -a $envfilename 1> /dev/null
. $envfilename

echo -e "\033[31;1m hadoop version \033[0m"
hadoop version

python config_hadoop.py $HADOOP_HOME $JAVA_HOME
echo -e "\033[31;1m hdfs namenode -format \033[0m"
hdfs namenode -format

echo -e "\033[31;1m start-dfs.sh \033[0m"
start-dfs.sh
echo -e "\033[31;1m jps \033[0m"
jps
echo -e "\033[31;1m jps应该得到和下面类似的结果：
12128 DataNode
11974 NameNode
12438 Jps
12314 SecondaryNameNode \033[0m"

echo -e "\033[31;1m ************配置hadoop************ \033[0m"
echo -e "\033[31;1m ********************************** \033[0m"

