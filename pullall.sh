#!/bin/bash

set -e -u -o pipefail

images=(
    rboyer/base:ubuntu
    rboyer/base-java:ubuntu
    rboyer/zookeeper:ubuntu
    rboyer/mesos:ubuntu
    rboyer/mesos-master:ubuntu
    rboyer/mesos-slave:ubuntu
    rboyer/mesos-agent:ubuntu
    rboyer/marathon:ubuntu

    rboyer/base:centos
    rboyer/base-java:centos
    rboyer/zookeeper:centos
    rboyer/mesos:centos
    rboyer/mesos-master:centos
    rboyer/mesos-slave:centos
    rboyer/marathon:centos

    rboyer/base:centos6
    rboyer/base-java:centos6
    rboyer/zookeeper:centos6
    rboyer/mesos:centos6
    rboyer/mesos-master:centos6
    rboyer/mesos-slave:centos6
    rboyer/marathon:centos6
)
# rboyer/steam:latest
# rboyer/devmesos:latest

for img in "${images[@]}"; do
    docker pull "${img}"
done
