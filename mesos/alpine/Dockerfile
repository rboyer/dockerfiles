FROM rboyer/base:alpine

ENV DKR_MESOS_VERSION 1.2.2

RUN apk update && apk add --no-cache \
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
    zlib

RUN \
    mkdir -p /opt && \
    wget -q -O - https://storage.googleapis.com/pkgrepo.rboyer.net/files/mesos-${DKR_MESOS_VERSION}-alpine.tar.gz | tar -xzf - -C /opt
