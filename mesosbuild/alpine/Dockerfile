FROM rboyer/base:alpine

# inlined from dockerfile for openjdk:8-jdk-alpine

# this is the JDK
# RUN \
#     apk add --no-cache openjdk8

# ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

#############################################

# https://gist.github.com/blue666man/c6ae9b19c01d813e1028898626930667

ENV MESOS_VERSION=1.0.1

RUN apk update
# Install a few utility tools and build code
RUN apk add --no-cache tar wget git
# Install essential development tools.
RUN apk add --no-cache alpine-sdk
# Install other Mesos dependencies.
RUN apk add --no-cache --virtual=mesos-build-deps \
    apr \
    apr-dev \
    curl-dev \
    cyrus-sasl-crammd5 \
    cyrus-sasl-dev \
    fts \
    fts-dev \
    libsasl \
    linux-headers \
    openssl-dev \
    subversion-dev \
    subversion-libs \
    zlib \
    zlib-dev
    # python-dev \

# $ sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
# apache-maven
# apr-util-devel
# # systemd >=218

WORKDIR /tmp
RUN wget http://www.apache.org/dist/mesos/${MESOS_VERSION}/mesos-${MESOS_VERSION}.tar.gz
RUN tar -zxf mesos-${MESOS_VERSION}.tar.gz
RUN mkdir mesos-${MESOS_VERSION}/build
WORKDIR /tmp/mesos-${MESOS_VERSION}/build
RUN ../configure --prefix=/opt/mesos --disable-python --disable-java
RUN make -j 2
RUN make check
RUN make install
