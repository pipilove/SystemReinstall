import sys
import os
import re

HADOOP_HOME = sys.argv[1]
JAVA_HOME = sys.argv[2]
coresite_filename = os.path.join(HADOOP_HOME, 'etc/hadoop/core-site.xml')
tmp_dir = os.path.join(HADOOP_HOME, 'tmp')

s = '''
<configuration>
        <property>
             <name>hadoop.tmp.dir</name>
             <value>file:tmp_dir</value>
             <description>Abase for other temporary directories.</description>
        </property>
        <property>
             <name>fs.defaultFS</name>
             <value>hdfs://localhost:9000</value>
        </property>
</configuration>
'''
s = s.replace('tmp_dir', tmp_dir)

with open(coresite_filename, 'r+') as file:
    lines = file.read()
    lines = re.sub('<configuration>.*</configuration>', s, lines, flags = re.S)
    file.seek(0)
    file.write(lines)


hdfssite_filename = os.path.join(HADOOP_HOME, 'etc/hadoop/hdfs-site.xml')
s1 = '''
<configuration>
        <property>
             <name>dfs.replication</name>
             <value>1</value>
        </property>
        <property>
             <name>dfs.namenode.name.dir</name>
             <value>file:dfs_name</value>
        </property>
        <property>
             <name>dfs.datanode.data.dir</name>
             <value>file:dfs_data</value>
        </property>
</configuration>
'''
s1 = s1.replace('dfs_name', os.path.join(tmp_dir, 'dfs/name')).replace('dfs_data', os.path.join(tmp_dir, 'dfs/data'))

with open(hdfssite_filename, 'r+') as file:
    lines = file.read()
    lines = re.sub('<configuration>.*</configuration>', s1, lines, flags = re.S)
    file.seek(0)
    file.write(lines)

#add JAVA_HOME
hadoop_config_filename = os.path.join(HADOOP_HOME, 'libexec/hadoop-config.sh')
s2 = 'export JAVA_HOME='+JAVA_HOME+'\n'
with open(hadoop_config_filename, 'r+') as file:
    lines = file.read()
    lines = re.sub('# Bail if we did not detect it', s2+'# Bail if we did not detect it', lines, flags = re.S)
    file.seek(0)
    file.write(lines)

