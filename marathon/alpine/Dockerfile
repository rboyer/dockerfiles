FROM rboyer/base-java:alpine

ENV DKR_MESOS_VERSION 1.2.2
ENV DKR_MARATHON_VERSION 1.1.2

RUN addgroup marathon && \
    adduser -S -G marathon marathon

RUN \
    apk add --no-cache \
    tar \
    curl \
    wget \
    apr \
    cyrus-sasl-crammd5 \
    fts \
    libcurl \
    libsasl \
    libstdc++ \
    subversion-libs \
    zlib && \
    mkdir -p /opt && \
    wget -q -O - https://storage.googleapis.com/pkgrepo.rboyer.net/files/mesos-${DKR_MESOS_VERSION}-alpine.tar.gz | tar -xzf - -C /opt && \
    apk add --no-cache bash && \
    mkdir -p /opt && \
    wget -q -O - http://downloads.mesosphere.com/marathon/v${DKR_MARATHON_VERSION}/marathon-${DKR_MARATHON_VERSION}.tgz | tar -xzf - -C /opt && \
    mv /opt/marathon-${DKR_MARATHON_VERSION} /opt/marathon && \
    cp -a /opt/mesos/lib/libmesos* /usr/local/lib

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# CMD ["--no-logger"]
