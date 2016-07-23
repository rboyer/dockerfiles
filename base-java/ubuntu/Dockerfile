FROM rboyer/base:ubuntu

# -jdk- instead of -jre- if you want javac
RUN \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DA1A4A13543B466853BAF164EB9B1D8886F44E2A && \
    echo 'deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu trusty main' > /etc/apt/sources.list.d/openjdk-ppa-trusty.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

