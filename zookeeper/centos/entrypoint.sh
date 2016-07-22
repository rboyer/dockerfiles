#!/bin/dumb-init /bin/sh
set -e

# Note above that we run dumb-init as PID 1 in order to reap zombie processes
# as well as forward signals to all processes in its session. Normally, sh
# wouldn't do either of these functions so we'd leak zombies as well as do
# unclean termination of all our sub-processes.

echo "1" > /var/lib/zookeeper/myid

readonly log4j_file=/etc/zookeeper/conf/log4j.properties

echo "log4j.rootLogger=INFO, CONSOLE" > $log4j_file
echo "log4j.appender.CONSOLE=org.apache.log4j.ConsoleAppender" >> $log4j_file
echo "log4j.appender.CONSOLE.Threshold=INFO" >> $log4j_file
echo "log4j.appender.CONSOLE.layout=org.apache.log4j.PatternLayout" >> $log4j_file
echo "log4j.appender.CONSOLE.layout.ConversionPattern=%d{ISO8601} - %-5p [%t:%C{1}@%L] - %m%n" >> $log4j_file

export ZOOCFGDIR=/etc/zookeeper/conf

chown -R app:app /var/lib/zookeeper /var/log/zookeeper

cd /opt/mesosphere/zookeeper

exec gosu app /opt/mesosphere/zookeeper/bin/zkServer.sh start-foreground
