FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
    echo 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' > /etc/apt/sources.list.d/java.list && \
    echo 'deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' >> /etc/apt/sources.list.d/java.list && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -qq -y oracle-java8-installer oracle-java8-set-default oracle-java8-unlimited-jce-policy && \
    rm -rf /var/cache/oracle-jdk8-installer

WORKDIR /data

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

CMD ["bash"]
