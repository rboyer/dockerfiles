FROM ubuntu:trusty

RUN apt-get update -y
RUN apt-get install -y \
	python \
	curl \
	python-apt \
	xterm \
	xz-utils \
	zenity

# http://wiki.ros.org/docker/Tutorials/GUI
RUN apt-get install -y x11-apps
RUN dpkg --add-architecture i386 && apt-get update -y
RUN apt-get install -y libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386
# lspci
RUN apt-get install -y pciutils
# dbus-launch
RUN apt-get install -y dbus-x11



COPY steam_latest.deb /tmp/steam.deb
RUN dpkg -i /tmp/steam.deb

RUN echo "dash dash/sh boolean false" | debconf-set-selections && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash


RUN locale-gen en_US.UTF-8 && update-locale

RUN adduser --disabled-password --gecos 'Steam' naelyn
RUN usermod -aG sudo naelyn
RUN usermod -aG video naelyn
RUN usermod -aG adm naelyn
RUN usermod -aG cdrom naelyn
RUN usermod -aG dip naelyn
RUN usermod -aG plugdev naelyn
RUN echo "naelyn ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/naelyn && \
	chmod 0440 /etc/sudoers.d/naelyn

USER naelyn
CMD ["steam"]

#sh: lspci: command not found
#libGL error: failed to open drm device: Permission denied
#libGL error: failed to load driver: i965
