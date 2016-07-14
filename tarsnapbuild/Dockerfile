FROM ubuntu:xenial
MAINTAINER R.B. Boyer <public@richardboyer.net>

# a variation of https://github.com/atmoz/tarsnap

ENV TARSNAP_VERSION 1.0.37
ENV TARSNAP_SHA256 fa999413651b3bd994547a10ffe3127b4a85a88b1b9a253f2de798888718dbfa

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y wget ca-certificates
RUN apt-get install -y gcc libc6-dev make libssl-dev zlib1g-dev e2fslibs-dev
RUN apt-get install -y checkinstall

COPY install /install
RUN /install

