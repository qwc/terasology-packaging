
FROM ubuntu:latest
MAINTAINER  Marcel M. Otte <qwc+docker@mmo.to>

RUN apt-get update && yes | apt-get upgrade
RUN yes | apt-get install ruby ruby-dev rubygems build-essential \
    wget openjdk-8-jre-headless unzip git

RUN gem install --no-ri --no-rdoc fpm

RUN useradd -m -d /home/devel -u 1000 -G users,tty -s /bin/bash devel \
    && mkdir /workspace && chown -R devel:users /workspace

USER devel

VOLUME /workspace
USER devel
WORKDIR /workspace
CMD /workspace/start.sh
