#!/bin/bash

source versionInfo.properties
source variables.sh

if [ "$1" -eq "" ]; then
  echo "usage: <script> deb|rpm|pacman"
fi

if [ "$1" -eq "deb" ]; then
  FPM_DEPENDENCY="openjdk-8-jre >= 8u40"
  FPM_DEP2="openjfx"
fi
if [ "$1" -eq "rpm" ]; then
  FPM_DEPENDENCY="java-1.8.0-openjdk >= 1.8.0.40"
  FPM_DEP2=""
fi
if [ "$1" -eq "pacman" ]; then
  FPM_DEPENDENCY="jre8-openjdk >= 8.u40"
  FPM_DEP2="java-openjfx"
fi


fpm \
  -m $FPM_MAINTAINER \
  --vendor $FPM_VENDOR \
  --license $FPM_LICENSE \
  --category $FPM_CATEGORY \
  --url $FPM_URL \
  --description "TerasologyLauncher - open source voxel world, launcher." \
  --verbose \
  -s dir \
  -t $1 \
  -n terasology-launcher \
  -v $buildNumber \
  -d $FPM_DEPENDENCY \
  -d $FPM_DEP2 \
  --prefix "/opt" \
  --force \
  -a all \
  TerasologyLauncher
