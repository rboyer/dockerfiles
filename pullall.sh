#!/bin/bash

set -e -u -o pipefail

images=(
    rboyer/base:ubuntu
    rboyer/base-java:ubuntu
    rboyer/mesos:ubuntu
    rboyer/mesos-master:ubuntu
    rboyer/mesos-slave:ubuntu
    rboyer/marathon:ubuntu
)
# rboyer/steam:latest
# rboyer/zookeeper:ubuntu
# rboyer/devmesos:latest

for img in "${images[@]}"; do
    docker pull "${img}"
done
