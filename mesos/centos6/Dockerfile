FROM rboyer/base:centos6

ENV DKR_MESOS_VERSION 1.2.2

# rpm -Uvh http://repos.mesosphere.com/el/6/noarch/RPMS/mesosphere-el-repo-6-3.noarch.rpm && \
COPY mesosphere.repo /etc/yum.repos.d/mesosphere.repo
COPY RPM-GPG-KEY-mesosphere /etc/pki/rpm-gpg/RPM-GPG-KEY-mesosphere

RUN \
    yum install -y "$(yum search --showduplicates mesos|grep "\b${DKR_MESOS_VERSION}\b" | cut -d' ' -f1 | sort | tail -n 1)" && \
    yum clean all
