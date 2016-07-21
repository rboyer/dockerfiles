FROM rboyer/ubuntu-base-java:latest

ENV MESOS_VERSION 0.28.2
ENV MARATHON_VERSION 1.1.1

RUN adduser --system --no-create-home --group marathon

RUN echo "deb http://repos.mesosphere.io/ubuntu/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv 81026D0004C44CF7EF55ADF8DF7D54CBE56151BF && \
  apt-get -y update && \
  apt-get -y install --no-install-recommends \
  mesos="$(apt-cache madison mesos | grep "\b${MESOS_VERSION}\b" | awk '{print $3}')" \
  marathon="$(apt-cache madison marathon | grep "\b${MARATHON_VERSION}\b" | awk '{print $3}')" && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["--no-logger"]
