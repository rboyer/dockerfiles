FROM rboyer/base-java:centos6

########################
# get python 2.7 installed
RUN yum install -y centos-release-SCL
RUN yum install -y python27

########################
# inlined from '/opt/rh/python27/enable'
ENV PATH "/opt/rh/python27/root/usr/bin${PATH:+:${PATH}}"
ENV LD_LIBRARY_PATH "/opt/rh/python27/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
ENV MANPATH "/opt/rh/python27/root/usr/share/man:${MANPATH}"
ENV XDG_DATA_DIRS "/opt/rh/python27/root/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
ENV PKG_CONFIG_PATH "/opt/rh/python27/root/usr/lib64/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"

########################
# upgrade pip before we get started
RUN pip install --upgrade pip

########################
# now install supervisor and configure it
RUN pip install supervisor
RUN pip install supervisor-stdout
RUN echo_supervisord_conf > /etc/supervisord.conf.dist
RUN mkdir -p /etc/supervisord.d

COPY supervisord.conf /etc/supervisord.conf

########################
# prep zookeeper

ENV ZOOKEEPER_VERSION 3.4.6

RUN \
    wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz | tar -xzf - -C /opt && \
    mv /opt/zookeeper-$ZOOKEEPER_VERSION /opt/zookeeper && \
    mkdir -p /zk/{config,data,logs}

COPY ./apps/zookeeper/log4j.properties /zk/config/log4j.properties
COPY ./apps/zookeeper/zoo.cfg /zk/config/zoo.cfg

COPY ./apps/zookeeper/zookeeper.conf /etc/supervisord.d/zookeeper.conf

VOLUME ["/zk/config", "/zk/data", "/zk/logs"]
EXPOSE 2181 2888 3888

########################
# prep mesos and marathon
ENV DKR_MESOS_VERSION 0.28.2
ENV DKR_MARATHON_VERSION 1.1.2

RUN groupadd mesos && \
    adduser --system --no-create-home -g mesos mesos
RUN groupadd marathon && \
    adduser --system --no-create-home -g marathon marathon

# rpm -Uvh http://repos.mesosphere.com/el/6/noarch/RPMS/mesosphere-el-repo-6-3.noarch.rpm && \
COPY ./apps/mesos/mesosphere.repo /etc/yum.repos.d/mesosphere.repo
COPY ./apps/mesos/RPM-GPG-KEY-mesosphere /etc/pki/rpm-gpg/RPM-GPG-KEY-mesosphere

RUN \
    yum install -y \
        "$(yum search --showduplicates mesos|grep "\b${DKR_MESOS_VERSION}\b" | cut -d' ' -f1 | sort -r | head -n 1)" && \
        "$(yum search --showduplicates marathon|grep "\b${DKR_MARATHON_VERSION}\b" | cut -d' ' -f1 | sort -r | head -n 1)" && \
    yum clean all


########################

########################
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
CMD ["entrypoint.sh"]
# CMD ["supervisord", "-c", "/etc/supervisord.conf"]
