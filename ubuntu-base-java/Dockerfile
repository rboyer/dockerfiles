FROM rboyer/ubuntu-base:latest

RUN \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y --no-install-recommends \
    oracle-java8-installer \
    oracle-java8-set-default \
    oracle-java8-unlimited-jce-policy && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
