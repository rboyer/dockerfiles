FROM centos:6

RUN yum install -y curl tar && \
    yum groupinstall -y "Development Tools"

RUN yum install -y epel-release
RUN yum install -y protobuf-compiler ncurses-devel zlib-devel libutempter-devel openssl-devel
RUN yum install -y glibc-static zlib-static protobuf-static protobuf-devel
RUN yum install -y openssl-static ncurses-static

WORKDIR /work
RUN curl -sL 'https://mosh.mit.edu/mosh-1.2.5.tar.gz' > mosh.tar.gz
RUN tar zvxf mosh.tar.gz
WORKDIR /work/mosh-1.2.5

# RUN ./configure LDFLAGS='-static'
