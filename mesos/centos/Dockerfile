FROM rboyer/base:centos

ENV DKR_MESOS_VERSION 0.28.2

RUN \
    rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm && \
    yum install -y "$(yum search --showduplicates mesos|grep "\b${DKR_MESOS_VERSION}\b" | cut -d' ' -f1)" && \
    yum clean all
