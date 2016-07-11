#!/bin/dumb-init /bin/sh
set -e

# Note above that we run dumb-init as PID 1 in order to reap zombie processes
# as well as forward signals to all processes in its session. Normally, sh
# wouldn't do either of these functions so we'd leak zombies as well as do
# unclean termination of all our sub-processes.

CONSUL_DATA_DIR=/etcd/data
CONSUL_CONFIG_DIR=/etcd/config

# If we are running Etcd, make sure it executes as the proper user.
if [ "$1" = 'etcd' ]; then
    set -- gosu etcd "$@"
fi

exec "$@"
