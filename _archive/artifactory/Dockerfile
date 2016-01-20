FROM centos:centos7

# base system packages
RUN yum install -y wget unzip && yum clean all

# add an 'app' user
RUN	mkdir /app && adduser -d /app -M app && chown -R app:app /app

# install java by hand to save space
ADD jre-7u71-linux-x64.tar.gz /opt
ENV JAVA_HOME /opt/jre1.7.0_71
ENV PATH /opt/jre1.7.0_71/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# go fetch artifactory
ADD artifactory-3.4.1.tar.gz /opt
RUN ln -sf /opt/artifactory-3.4.1 /opt/artifactory

COPY artifactory.sh /opt/artifactory/bin/

VOLUME ["/data","/logs"]

# http
EXPOSE 8081
# ajp
#EXPOSE 8019
# tomcat management
#EXPOSE 8015

#USER app

CMD ["/opt/artifactory/bin/artifactory.sh"]
