#!/bin/bash

set -e -o pipefail

sudo docker inspect cdh5-data >/dev/null 2>&1 || {
	sudo docker create \
		--name cdh5-data \
		-v /var/lib/hadoop-hdfs \
		-v /var/lib/zookeeper \
		-v /var/log/hadoop-hdfs \
		-v /var/log/hbase \
		-v /var/log/zookeeper \
		busybox
}


sudo docker run \
	--name cdh5 \
	--rm \
	-it \
	--volumes-from cdh5-data \
	-p 88:88 \
	naelyn/cdh5
