FROM rboyer/base-java:centos

ENV MESOS_VERSION 0.28.2
ENV MARATHON_VERSION 1.1.1

RUN groupadd marathon && \
    adduser --system --no-create-home -g marathon marathon

RUN \
    rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm && \
    yum install -y \
        "$(yum search --showduplicates mesos|grep "\b${MESOS_VERSION}\b" | cut -d' ' -f1)" \
        "$(yum search --showduplicates marathon|grep "\b${MARATHON_VERSION}\b" | cut -d' ' -f1)" && \
    yum clean all

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["--no-logger"]
