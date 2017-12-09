FROM rboyer/base-java:ubuntu

ENV DKR_MESOS_VERSION 1.2.2
ENV DKR_MARATHON_VERSION 1.1.2

RUN adduser --system --no-create-home --group marathon

RUN echo "deb http://repos.mesosphere.io/ubuntu/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv 81026D0004C44CF7EF55ADF8DF7D54CBE56151BF && \
  apt-get -y update && \
  apt-get -y install --no-install-recommends \
  mesos="$(apt-cache madison mesos | grep "\b${DKR_MESOS_VERSION}\b" | sort | tail -n 1 | awk '{print $3}')" \
  marathon="$(apt-cache madison marathon | grep "\b${DKR_MARATHON_VERSION}\b" | sort | tail -n 1 | awk '{print $3}')" && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["--no-logger"]
