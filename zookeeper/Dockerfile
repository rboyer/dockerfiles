FROM rboyer/ubuntu-base-java:latest

RUN \
  apt-get update && \
  apt-get -y install --no-install-recommends \
  zookeeper zookeeper-bin zookeeperd && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

VOLUME ["/var/lib/zookeeper", "/var/log/zookeeper"]
EXPOSE 2181 2888 3888

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
