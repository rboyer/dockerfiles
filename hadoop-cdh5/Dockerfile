FROM phusion/baseimage:latest

RUN apt-get update

RUN apt-get install -y \
	tmux unzip vim \
	curl lynx nmap rsync wget whois \
	git git-core sed

RUN apt-get install -y default-jdk

RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key | apt-key add -

COPY config/cloudera.pref /etc/apt/preferences.d/cloudera.pref

RUN apt-add-repository 'deb [arch=amd64] http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh trusty-cdh5 contrib'

RUN apt-get update

RUN apt-get install -y krb5-kdc krb5-admin-server
RUN apt-get install -y hadoop-0.20-conf-pseudo 
RUN apt-get install -y zookeeper-server
RUN apt-get install -y hbase hbase-master hbase-regionserver

# format the namenode and bookmark that logic
RUN sudo -u hdfs hdfs namenode -format
RUN mkdir -p /var/lib/hadoop-hdfs.dist/ && \
	rsync -avx /var/lib/hadoop-hdfs/ /var/lib/hadoop-hdfs.dist/

# now drop in HDFS configs that require auth
COPY config/core-site.xml /etc/hadoop/conf/core-site.xml
COPY config/hdfs-site.xml /etc/hadoop/conf/hdfs-site.xml
COPY config/hbase-site.xml /etc/hbase/conf/hbase-site.xml

# kerberos config
RUN	mkdir -p /etc/krb5kdc && chmod 700 /etc/krb5kdc

# kdc config
COPY config/kdc.conf /etc/krb5kdc/kdc.conf
# kdc acl
COPY config/kadm5.acl /etc/krb5kdc/kadm5.acl
# client config
COPY config/krb5.conf /etc/krb5.conf

# why doesn't echo -e "example\nexample" work here?
RUN echo "example" > /root/.tmppass && \
	echo "example" >> /root/.tmppass

# create initial database
RUN cat /root/.tmppass | kdb5_util create -s

# create admin user (USERNAME/admin)
RUN cat /root/.tmppass | kadmin.local -q "addprinc admin/admin"

# create hadoopy users
RUN kadmin.local -q "addprinc -randkey hdfs"
RUN kadmin.local -q "addprinc -randkey hbase"
RUN kadmin.local -q "addprinc -randkey HTTP"

# create keytabs
WORKDIR /etc/hadoop/conf
RUN kadmin.local -q 'xst -norandkey -k hdfs.keytab hdfs'
RUN kadmin.local -q 'xst -norandkey -k hdfs.keytab hbase'
RUN kadmin.local -q 'xst -norandkey -k hdfs.keytab HTTP'
WORKDIR /

# NOTE THIS IS ONLY FOR LOCAL TESTING!!!!
RUN chmod 444 /etc/hadoop/conf/*.keytab

# create demo user (unprivileged)
RUN cat /root/.tmppass | kadmin.local -q "addprinc demo"


# prep the init scripts
RUN mkdir -p /etc/my_init.d
COPY 01_start.sh /etc/my_init.d/01_start.sh
RUN chmod +x /etc/my_init.d/*.sh

VOLUME [ "/var/lib/hadoop-hdfs", "/var/lib/zookeeper", "/var/log/hadoop-hdfs", "/var/log/hbase", "/var/log/zookeeper" ]

