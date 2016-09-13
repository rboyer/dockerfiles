FROM rboyer/base:alpine

ENV DKR_MESOS_VERSION 1.0.1

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
    cd /tmp && \
    wget https://storage.googleapis.com/pkgrepo.rboyer.net/files/mesos-${DKR_MESOS_VERSION}-alpine.tar.gz && \
    tar zvxf mesos-${DKR_MESOS_VERSION}-alpine.tar.gz && \
    mkdir -p /opt && \
    mv mesos /opt
