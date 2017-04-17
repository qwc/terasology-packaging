
FROM fedora:latest
MAINTAINER  Marcel M. Otte <qwc+docker@mmo.to>

RUN dnf -y check-update | true
RUN dnf -y distro-sync | true
RUN dnf -y install ruby-devel gcc make rpm-build wget unzip \
  java-1.8.0-openjdk-headless git

RUN gem install --no-ri --no-rdoc fpm

RUN useradd -m -d /home/devel -u 1000 -G users,tty -s /bin/bash devel \
    && mkdir /workspace && chown -R devel:users /workspace

USER devel

VOLUME /workspace
USER devel
WORKDIR /workspace
CMD /workspace/start.sh
