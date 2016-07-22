FROM rboyer/mesos:centos

RUN groupadd mesos && \
    adduser --system --no-create-home -g mesos mesos

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
