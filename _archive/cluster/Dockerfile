FROM centos:centos6

# http://beingasysadmin.wordpress.com/2014/06/27/managing-docker-clusters-using-mesos-and-marathon/
# http://tepid.org/tech/01-aurora-mesos-cluster/

# This is one mega image that is more like a VM for full-stack testing.
# NOT meant for real use.

## https://mesosphere.io/learn/install_centos_rhel/

# install zookeeper & java
RUN curl -sSfL http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm --output /tmp/cdh.rpm
RUN	curl -sSfL http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera --output /tmp/cdh.key
RUN	rpm --import /tmp/cdh.key
RUN	yum localinstall -y -q /tmp/cdh.rpm
RUN yum install -y -q java-1.7.0-openjdk zookeeper-server rpm python-setuptools
ENV JAVA_HOME /usr/lib/jvm/jre

# install supervisor (now that python is installed)
RUN easy_install pip && pip install supervisor
RUN echo_supervisord_conf > /etc/supervisord.conf
ADD supervisord.conf /etc/supervisord.conf

# initialize zookeeper
RUN su -s /bin/sh zookeeper -c "/usr/bin/zookeeper-server-initialize"
RUN echo 1 > /var/lib/zookeeper/myid

# add zk to supervisor & restart everything
ADD zk.conf /etc/supervisor/conf.d/zk.conf
#RUN supervisorctl reload

# install mesos
RUN curl -sSfL http://downloads.mesosphere.io/master/centos/6/mesos-0.20.0-1.0.centos64.x86_64.rpm --output /tmp/mesos.rpm
RUN yum localinstall -y -q /tmp/mesos.rpm
RUN rm /tmp/mesos.rpm

## exec /usr/bin/mesos-init-wrapper master
## exec /usr/bin/mesos-init-wrapper slave
ADD mesos-master.conf /etc/supervisor/conf.d/mesos-master.conf
ADD mesos-slave.conf /etc/supervisor/conf.d/mesos-slave.conf

# optional mesos python glue
RUN curl -sSfL http://downloads.mesosphere.io/master/centos/6/mesos-0.20.0-py2.6.egg --output /tmp/mesos.egg
RUN easy_install --allow-hosts pypi.python.org /tmp/mesos.egg 
RUN rm /tmp/mesos.egg

# install marathon
# https://mesosphere.io/learn/run-services-with-marathon/
RUN curl -sSfL http://downloads.mesosphere.io/marathon/marathon-0.4.0.tgz --output /tmp/marathon.tgz
RUN tar zvxf /tmp/marathon.tgz
ADD marathon.conf /etc/supervisor/conf.d/marathon.conf

# RUN echo in_memory > /etc/mesos-master/registry

VOLUME ["/var/log", "/var/lib"]

# zk
EXPOSE 2181
# mesos-master
## curl -i http://localhost:5050/master/health
EXPOSE 5050
# marathon
## curl -i http://localhost:8080/
EXPOSE 8080

CMD ["/usr/bin/supervisord", "--nodaemon"]
