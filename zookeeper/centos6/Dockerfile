FROM rboyer/base-java:centos6

RUN \
    rpm -Uvh http://repos.mesosphere.com/el/6/noarch/RPMS/mesosphere-el-repo-6-3.noarch.rpm && \
    yum install -y mesosphere-zookeeper && \
    yum clean all

VOLUME ["/var/lib/zookeeper", "/var/log/zookeeper"]
EXPOSE 2181 2888 3888

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
