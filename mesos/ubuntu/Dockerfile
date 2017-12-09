FROM rboyer/base:ubuntu

ENV DKR_MESOS_VERSION 1.2.2
# TODO: bsdtar? unzip?

  # mesos="$(apt-cache search --names-only '^mesos$' -f | grep "^Version: " | cut -d' ' -f2-)" && \
RUN echo "deb http://repos.mesosphere.io/ubuntu/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv 81026D0004C44CF7EF55ADF8DF7D54CBE56151BF && \
  apt-get -y update && \
  apt-get -y install --no-install-recommends \
  mesos="$(apt-cache madison mesos | grep "\b${DKR_MESOS_VERSION}\b" | sort | tail -n 1 | awk '{print $3}')" && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
