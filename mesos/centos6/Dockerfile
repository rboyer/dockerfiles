FROM rboyer/base:centos6

ENV DKR_MESOS_VERSION 0.28.2

RUN \
    rpm -Uvh http://repos.mesosphere.com/el/6/noarch/RPMS/mesosphere-el-repo-6-3.noarch.rpm && \
    yum install -y "$(yum search --showduplicates mesos|grep "\b${DKR_MESOS_VERSION}\b" | cut -d' ' -f1)" && \
    yum clean all
