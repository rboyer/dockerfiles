FROM rboyer/base-java:centos6

ENV DKR_MESOS_VERSION 0.28.2
ENV DKR_MARATHON_VERSION 1.1.2

RUN groupadd marathon && \
    adduser --system --no-create-home -g marathon marathon

RUN \
    rpm -Uvh http://repos.mesosphere.com/el/6/noarch/RPMS/mesosphere-el-repo-6-3.noarch.rpm && \
    yum install -y \
        "$(yum search --showduplicates mesos|grep "\b${DKR_MESOS_VERSION}\b" | cut -d' ' -f1)" \
        "$(yum search --showduplicates marathon|grep "\b${DKR_MARATHON_VERSION}\b" | cut -d' ' -f1)" && \
    yum clean all

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["--no-logger"]
