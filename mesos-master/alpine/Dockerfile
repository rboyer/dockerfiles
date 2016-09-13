FROM rboyer/mesos:alpine

RUN addgroup mesos && \
    adduser -S -G mesos mesos

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
