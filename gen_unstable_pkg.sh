#!/bin/bash

source versionInfo.properties
source variables.sh
source variables_unstable.sh

if [ -z "$1" ]; then
  echo "usage: <script> deb|rpm|pacman"
  exit 1
fi

if [ "$1" -eq "deb" ]; then
  FPM_DEPENDENCY="openjdk-8-jre >= 8u40"
fi
if [ "$1" -eq "rpm" ]; then
  FPM_DEPENDENCY="java-1.8.0-openjdk >= 1.8.0.40"
fi
if [ "$1" -eq "pacman" ]; then
  FPM_DEPENDENCY="jre8-openjdk >= 8.u40"
fi

fpm \
  -m $FPM_MAINTAINER \
  --vendor $FPM_VENDOR \
  --license $FPM_LICENSE \
  --category $FPM_CATEGORY \
  --url $FPM_URL \
  --description $FPM_DESCRIPTION \
  --verbose \
  -s dir \
  -t $1 \
  -n terasology-unstable \
  -v $engineVersion-$buildNumber \
  -d "openjdk-8-jre >= 8u40" \
  --prefix "/opt" \
  --force \
  -a all \
  terasology
