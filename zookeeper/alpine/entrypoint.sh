#!/bin/dumb-init /bin/sh
set -e

# Note above that we run dumb-init as PID 1 in order to reap zombie processes
# as well as forward signals to all processes in its session. Normally, sh
# wouldn't do either of these functions so we'd leak zombies as well as do
# unclean termination of all our sub-processes.

echo "1" > /zk/data/myid

export ZOOCFGDIR=/zk/config

chown -R app:app /zk/data /zk/logs

exec gosu app /opt/zookeeper/bin/zkServer.sh start-foreground
