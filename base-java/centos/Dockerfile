FROM rboyer/base:centos

RUN \
    mkdir -p /tmp/build && \
    cd /tmp/build && \
    wget --no-cookies --no-check-certificate \
        --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
        "http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm" && \
    yum localinstall -y jdk-8u102-linux-x64.rpm && \
    cd /tmp && \
    rm -rf /tmp/build && \
    yum clean all

ENV JAVA_HOME /usr/java/default
