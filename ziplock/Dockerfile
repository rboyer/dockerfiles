FROM ubuntu:trusty

# this will prepare a base system to run mesos from

RUN apt-get update
RUN apt-get install --no-install-recommends -y apt-transport-https ca-certificates wget curl unzip

#################################################
# KEYS

# mesosphere key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 81026D0004C44CF7EF55ADF8DF7D54CBE56151BF
# openjdk-r ppa
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DA1A4A13543B466853BAF164EB9B1D8886F44E2A

#################################################
# REPOS
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list
RUN echo "deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu trusty main" > /etc/apt/sources.list.d/openjdk-ppa-trusty.list

RUN apt-get -y update

#################################################
# PACKAGES

ENV DKR_MESOS_VERSION 1.0.0
ENV DKR_MARATHON_VERSION 1.1.2

# MESOS (master & agent)
RUN apt-get -y install --no-install-recommends \
  mesos="$(apt-cache madison mesos | grep "\b${DKR_MESOS_VERSION}\b" | awk '{print $3}')" \
  marathon="$(apt-cache madison marathon | grep "\b${DKR_MARATHON_VERSION}\b" | awk '{print $3}')"

# JAVA
# -jdk- instead of -jre- if you want javac
RUN apt-get install -y --no-install-recommends openjdk-8-jre-headless

# ZK
RUN apt-get install -y --no-install-recommends zookeeper zookeeper-bin zookeeperd

#################################################
# cleanup
RUN rm -rf /root/.gnupg
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN rm -rf /usr/lib/mesos/3rdparty
RUN rm -rf /usr/include/mesos
RUN rm -rf /usr/lib/python2.7/site-packages/mesos*
RUN rm -f /usr/lib/pkgconfig/mesos.pc
RUN rm -f /usr/bin/mesos*
RUN rm -rf /etc/mesos /etc/mesos-master /etc/mesos-agent /etc/mesos-slave /etc/marathon
RUN rm -rf /usr/etc/mesos
RUN rm -rf /var/lib/mesos /var/log/mesos
RUN rm -f /etc/init/mesos-master.conf /etc/init/mesos-slave.conf
RUN rm -f /etc/default/mesos*
RUN rm -f /etc/init.d/marathon
RUN rm -f /etc/init/marathon.conf

RUN rm -rf /etc/apt /var/lib/dpkg

######### TODO STILL NEEDED?????????? ###########
# Default to UTF-8 file.encoding
RUN locale-gen "en_US.UTF-8"
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# RUN adduser --system --no-create-home --group mesos
# RUN adduser --system --no-create-home --group marathon
