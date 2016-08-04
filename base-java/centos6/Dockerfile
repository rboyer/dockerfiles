FROM rboyer/base:centos6

# -devel is the JDK, this is the JRE
RUN \
    yum install -y java-1.8.0-openjdk-headless && \
    yum clean all

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0
