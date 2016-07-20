FROM rboyer/mesos:latest

RUN adduser --system --no-create-home --group mesos

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
