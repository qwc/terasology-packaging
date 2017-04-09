#!/bin/bash

source versionInfo.properties



fpm \
  -m "Marcel Otte <qwc+terasology@mmo.to>" \
  --vendor "MovingBlocks" \
  --license "Apache 2.0" \
  --category "Games" \
  --url "http://terasology.org" \
  --description "TerasologyLauncher - open source voxel world, launcher." \
  --verbose \
  -s dir \
  -t deb \
  -n terasology-launcher \
  -v $buildNumber \
  -d "openjdk-8-jre" \
  -d "openjfx" \
  --prefix "/opt" \
  --force \
  -a all \
  TerasologyLauncher
