FROM rboyer/base-java:centos6

ENV DKR_MESOS_VERSION 1.0.1
ENV DKR_MARATHON_VERSION 1.1.2

RUN groupadd marathon && \
    adduser --system --no-create-home -g marathon marathon

# rpm -Uvh http://repos.mesosphere.com/el/6/noarch/RPMS/mesosphere-el-repo-6-3.noarch.rpm && \
COPY mesosphere.repo /etc/yum.repos.d/mesosphere.repo
COPY RPM-GPG-KEY-mesosphere /etc/pki/rpm-gpg/RPM-GPG-KEY-mesosphere

RUN \
    yum install -y \
        "$(yum search --showduplicates mesos|grep "\b${DKR_MESOS_VERSION}\b" | cut -d' ' -f1 | sort | tail -n 1)" \
        "$(yum search --showduplicates marathon|grep "\b${DKR_MARATHON_VERSION}\b" | cut -d' ' -f1 | sort | tail -n 1)" && \
    yum clean all

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["--no-logger"]
