FROM rboyer/base-java:alpine

ENV DKR_MESOS_VERSION 1.0.1
ENV DKR_MARATHON_VERSION 1.1.2

RUN addgroup marathon && \
    adduser -S -G marathon marathon

RUN \
    apk add --no-cache bash && \
    mkdir -p /opt && \
    wget -q -O - http://downloads.mesosphere.com/marathon/v${DKR_MARATHON_VERSION}/marathon-${DKR_MARATHON_VERSION}.tgz | tar -xzf - -C /opt && \
    mv /opt/marathon-${DKR_MARATHON_VERSION} /opt/marathon && \
    true

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# CMD ["--no-logger"]
