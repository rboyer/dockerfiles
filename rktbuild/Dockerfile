FROM ubuntu:xenial
MAINTAINER R.B. Boyer <public@richardboyer.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y --no-install-recommends curl wget
RUN apt-get install -y --no-install-recommends \
        ca-certificates \
        gnupg2 \
        bash-completion \
        checkinstall

# https://raw.githubusercontent.com/coreos/rkt/v1.10.1/scripts/install-rkt.sh
RUN wget 'https://raw.githubusercontent.com/coreos/rkt/v1.14.0/scripts/install-rkt.sh' -O /bin/install-rkt.sh && \
    chmod +x /bin/install-rkt.sh
RUN /bin/install-rkt.sh

