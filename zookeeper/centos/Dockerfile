FROM rboyer/base-java:centos

RUN \
    rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm && \
    yum install -y mesosphere-zookeeper && \
    yum clean all

VOLUME ["/var/lib/zookeeper", "/var/log/zookeeper"]
EXPOSE 2181 2888 3888

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
