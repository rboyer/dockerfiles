FROM centos:7

# LOCAL: make this faster
RUN yum install -y deltarpm

# Install a few utility tools
RUN yum install -y tar wget git

# Fetch the Apache Maven repo file.
RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo

# Install the EPEL repo so that we can pull in 'libserf-1' as part of our
# subversion install below.
RUN yum install -y epel-release

# 'Mesos > 0.21.0' requires 'subversion > 1.8' devel package,
# which is not available in the default repositories.
# Create a WANdisco SVN repo file to install the correct version:
RUN echo '[WANdiscoSVN]'$'\n''name=WANdisco SVN Repo 1.9'$'\n''enabled=1'$'\n''baseurl=http://opensource.wandisco.com/centos/7/svn-1.9/RPMS/\$basearch/'$'\n''gpgcheck=1'$'\n''gpgkey=http://opensource.wandisco.com/RPM-GPG-KEY-WANdisco'$'\n' > /etc/yum.repos.d/wandisco-svn.repo

# Parts of Mesos require systemd in order to operate. However, Mesos
# only supports versions of systemd that contain the 'Delegate' flag.
# This flag was first introduced in 'systemd version 218', which is
# lower than the default version installed by centos. Luckily, centos
# 7.1 has a patched 'systemd < 218' that contains the 'Delegate' flag.
# Explicity update systemd to this patched version.
RUN yum update -y systemd

# Install essential development tools.
RUN yum groupinstall -y "Development Tools"

# Install other Mesos dependencies.
RUN yum install -y apache-maven python-devel python-six python-virtualenv java-1.8.0-openjdk-devel zlib-devel libcurl-devel openssl-devel cyrus-sasl-devel cyrus-sasl-md5 apr-devel subversion-devel apr-util-devel
