FROM rboyer/base-java:ubuntu

RUN \
  apt-get update && \
  apt-get -y install --no-install-recommends \
  zookeeper zookeeper-bin zookeeperd && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/zookeeper", "/var/log/zookeeper"]
EXPOSE 2181 2888 3888

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
