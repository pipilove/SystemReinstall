#!/etc/bin/bash
# File:    ~/SysReinstall/scripts/6spark_config.sh
# Author:  pipi
# Email: pipisorry@126.com

echo -e "\033[31;1m ********************************* \033[0m"
echo -e "\033[31;1m *************手动配置************* \033[0m"
export ENV=~/ENV
export envfilename=~/.bashrc
export envfilename2=~/.profile
export SPARK_HOME=$ENV/spark
#export PYSPARK_PYTHON=$ENV/ubuntu_env/bin/python
export PYSPARK_PYTHON=$ENV/anaconda3/bin/python
echo -e "\033[31;1m http://spark.apache.org/downloads.html \033[0m"
export SPARK_URL=http://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-2.0.1/spark-2.0.1-bin-hadoop2.7.tgz
export SPARK_URL2=http://d3kbcqa49mib13.cloudfront.net/spark-2.0.1-bin-hadoop2.7.tgz
echo -e "\033[31;1m *************手动配置************* \033[0m"
echo -e "\033[31;1m ********************************** \033[0m"

test -d $ENV || mkdir -p $ENV

echo -e "\033[31;1m ********************************* \033[0m"
echo -e "\033[31;1m ************配置spark************ \033[0m"
read -p "download newest spark tarball? y/n: " install_comfirm
if [ $install_comfirm = 'y' -o $install_comfirm = 'Y' -o $install_comfirm = 'yes' ]; then
    test -f ../install/spark-* && rm -f ../install/spark-* ; wget $SPARK_URL -P ../install/ || wget $SPARK_URL2 -P ../install/
fi
test -f ../install/spark-* || wget $SPARK_URL -P ../install/ || wget $SPARK_URL2 -P ../install/
test -d $ENV/spark-*/ && rm -rf $ENV/spark-*/
tar -zxf ../install/spark-*.tgz -C $ENV
ln -sf $ENV/spark-*/ $ENV/spark

echo -e "\033[31;1m 配置路径(配置~/.profile才可以在pycharm中运行pyspark) \033[0m"
(echo "export SPARK_HOME=$ENV/spark
export PYSPARK_PYTHON=$PYSPARK_PYTHON
export PATH=\${SPARK_HOME}/bin:\$PATH") | sudo tee -a $envfilename $envfilename2
. $envfilename
. $envfilename2

#echo -e "\033[31;1m 配置spark-env变量 \033[0m"
#cp $SPARK_HOME/conf/spark-env.sh.template $SPARK_HOME/conf/spark-env.sh
#(echo -e "export PYSPARK_PYTHON=$PYSPARK_PYTHON
#export SPARK_HOME=$SPARK_HOME
#export SPARK_LOCAL_IP=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d : -f 2 | awk '{ print $1 }')
#export JAVA_HOME=$ENV/jdk") >> $SPARK_HOME/conf/spark-env.sh

echo -e "\033[31;1m 简略Spark输出 \033[0m"
cp $SPARK_HOME/conf/log4j.properties.template $SPARK_HOME/conf/log4j.properties
sed -i 's/INFO/WARN/g' $SPARK_HOME/conf/log4j.properties
pip install py4j 1> /dev/null
echo -e "\033[31;1m pyspark测试 \033[0m"
pyspark

echo -e "\033[31;1m ************配置spark************ \033[0m"
echo -e "\033[31;1m ********************************* \033[0m"

