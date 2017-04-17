#!/bin/bash

source versionInfo.properties
source variables.sh

FPM_DESCRIPTION="Terasology - open source voxel world."

if [ -z "$1" ]; then
  echo "usage: <script> deb|rpm|pacman"
  exit 1
fi

if [ "$1" == "deb" ]; then
  FPM_DEPENDENCY="openjdk-8-jre >= 8u40"
  FPM_ARCH="all"
fi
if [ "$1" == "rpm" ]; then
  FPM_DEPENDENCY="java-1.8.0-openjdk >= 1.8.0.40"
  FPM_ARCH="x86_64"
fi
if [ "$1" == "pacman" ]; then
  FPM_DEPENDENCY="jre8-openjdk >= 8.u40"
  FPM_ARCH="all"
fi

pushd root/usr/bin/
ln -s ../../opt/terasology/run_linux.sh terasology
popd

cp terasology.desktop root/usr/share/applications/

fpm \
  -m "$FPM_MAINTAINER" \
  --vendor "$FPM_VENDOR" \
  --license "$FPM_LICENSE" \
  --category "$FPM_CATEGORY" \
  --url "$FPM_URL" \
  --description "$FPM_DESCRIPTION" \
  --verbose \
  --log debug \
  -C root \
  -s dir \
  -t "$1" \
  -n terasology \
  -v "$engineVersion" \
  -d "$FPM_DEPENDENCY" \
  --force \
  -a "$FPM_ARCH" \
  opt \
  usr
