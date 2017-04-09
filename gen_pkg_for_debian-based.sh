#!/bin/bash

source versionInfo.properties



fpm \
  -m "Marcel Otte <qwc+terasology@mmo.to>" \
  --vendor "MovingBlocks" \
  --license "Apache 2.0" \
  --category "Games" \
  --url "http://terasology.org" \
  --description "Terasology - open source voxel world, bleeding edge Omega release." \
  --verbose \
  -s dir \
  -t deb \
  -n terasology-unstable \
  -v $engineVersion-$buildNumber \
  -d "openjdk-8-jre" \
  --prefix "/opt" \
  --force \
  -a all \
  terasology
