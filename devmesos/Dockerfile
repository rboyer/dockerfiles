FROM ubuntu:trusty
# FROM ubuntu:xenial

RUN useradd rboyer -u 1000 -s /bin/bash -m

################################################
# Update the packages.

RUN sed -i 's@http://archive.ubuntu.com/ubuntu/@mirror://mirrors.ubuntu.com/mirrors.txt@g' /etc/apt/sources.list
RUN apt-get update

# Install a few utility tools.
RUN apt-get install -y tar wget git

# Install the latest OpenJDK.
RUN apt-get install -y openjdk-7-jdk

# Install autotools (Only necessary if building from git repository).
RUN apt-get install -y autoconf libtool

# Install other Mesos dependencies.
RUN apt-get -y install \
    build-essential python-dev \
    libcurl4-nss-dev libsasl2-dev \
    libsasl2-modules \
    maven libapr1-dev libsvn-dev
################################################

RUN apt-get install -y gdb strace curl ca-certificates unzip
