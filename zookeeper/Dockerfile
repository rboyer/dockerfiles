FROM ubuntu:trusty

RUN apt-get update
RUN apt-get -y install zookeeper
RUN apt-get -y install zookeeper-bin zookeeperd

COPY start.sh /bin/start.sh

ENV JAVA_HOME /usr/lib/jvm/default-jvm

VOLUME ["/var/lib/zookeeper", "/var/log/zookeeper"]

EXPOSE 2181 2888 3888

CMD [ "/bin/start.sh" ]
