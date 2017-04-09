#!/bin/bash

source versionInfo.properties


if [ "$1" -e ""]; then
  echo "usage: <script> deb|rpm|pacman"
fi


fpm \
  -m "Marcel Otte <qwc+terasology@mmo.to>" \
  --vendor "MovingBlocks" \
  --license "Apache 2.0" \
  --category "Games" \
  --url "http://terasology.org" \
  --description "TerasologyLauncher - open source voxel world, launcher." \
  --verbose \
  -s dir \
  -t $1 \
  -n terasology-launcher \
  -v $buildNumber \
  -d "openjdk-8-jre" \
  -d "openjfx" \
  --prefix "/opt" \
  --force \
  -a all \
  TerasologyLauncher
