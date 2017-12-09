#!/bin/bash

set -e -o pipefail

chown -R hdfs:hdfs /var/log/hadoop-hdfs
chown -R hbase:hbase /var/log/hbase
chown -R zookeeper:zookeeper /var/log/zookeeper

###########################
# initialize kerberos
###########################

service krb5-kdc start
service krb5-admin-server start

###########################
# initialize HDFS
###########################

if [[ ! -e /var/lib/hadoop-hdfs/cache/hdfs/dfs/name/current/seen_txid ]]; then
	echo "Restoring HDFS initialized db to volume..."
	rsync -avx --delete /var/lib/hadoop-hdfs.dist/ /var/lib/hadoop-hdfs/
fi

chown -R hdfs:hadoop /var/lib/hadoop-hdfs

echo "Starting all HDFS services..."
for svc in \
	hadoop-hdfs-datanode \
	hadoop-hdfs-namenode \
	hadoop-hdfs-secondarynamenode \
	; do
	service "${svc}" start
done

if [[ ! -e /var/lib/hadoop-hdfs/.hdfs_initialized ]]; then
	echo "Initializing HDFS paths..."
	kinit hdfs@EXAMPLE.COM -k -t /etc/hadoop/conf/hdfs.keytab
	/usr/lib/hadoop/libexec/init-hdfs.sh
	kdestroy -A
	touch /var/lib/hadoop-hdfs/.hdfs_initialized
fi

chown -R zookeeper:zookeeper /var/lib/zookeeper

if [[ ! -e /var/lib/zookeeper/version-2 ]]; then
	echo "Initializing zookeeper data..."
	service zookeeper-server init
fi

echo "Starting zookeeper..."
service zookeeper-server start

echo "Starting all HBase services..."
for svc in \
	hbase-master \
	hbase-regionserver \
	; do
	service "${svc}" start
done

readonly PRIVATE_IP=$(ip -o -4 addr show dev eth0 | awk '{print $4}' | cut -d'/' -f1)

echo "==================================================="
echo "CDH5 Listening on these ports:"
echo ""
echo "Kerberos realm EXAMPLE.COM"
echo ""
echo "Kerberos (tcp):  ${PRIVATE_IP}:88"
echo "Namenode (http): http://${PRIVATE_IP}:50070"
echo "Namenode (wire): ${PRIVATE_IP}:8020"
echo "Zookeeper:       ${PRIVATE_IP}:2181"
echo "HBase (http):    http://${PRIVATE_IP}:60010"
echo "HBase (wire):    ${PRIVATE_IP}:60000"
