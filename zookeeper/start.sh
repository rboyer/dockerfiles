#!/bin/bash

set -e -o pipefail

echo "1" > /var/lib/zookeeper/myid

readonly log4j_file=/etc/zookeeper/conf/log4j.properties

echo "log4j.rootLogger=INFO, CONSOLE" > $log4j_file
echo "log4j.appender.CONSOLE=org.apache.log4j.ConsoleAppender" >> $log4j_file
echo "log4j.appender.CONSOLE.Threshold=INFO" >> $log4j_file
echo "log4j.appender.CONSOLE.layout=org.apache.log4j.PatternLayout" >> $log4j_file
echo "log4j.appender.CONSOLE.layout.ConversionPattern=%d{ISO8601} - %-5p [%t:%C{1}@%L] - %m%n" >> $log4j_file


. /etc/zookeeper/conf/environment

#exec start-stop-daemon --start -c $USER --exec $JAVA --name zookeeper \
#	-- -cp $CLASSPATH $JAVA_OPTS -Dzookeeper.log.dir=${ZOO_LOG_DIR} \
#	-Dzookeeper.root.logger=${ZOO_LOG4J_PROP} $ZOOMAIN $ZOOCFG

exec $JAVA -cp $CLASSPATH $JAVA_OPTS \
	-Dzookeeper.root.logger=${ZOO_LOG4J_PROP} \
	$ZOOMAIN $ZOOCFG
