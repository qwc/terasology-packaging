#!/bin/bash

source versionInfo.properties
source variables.sh

if [ -z "$1" ]; then
  echo "usage: <script> deb|rpm|pacman"
fi

if [ "$1" == "deb" ]; then
  FPM_DEPENDENCY="openjdk-8-jre >= 8u40"
  FPM_DEP2="openjfx"
  FPM_ARCH="all"
fi
if [ "$1" == "rpm" ]; then
  FPM_DEPENDENCY="java-1.8.0-openjdk >= 1.8.0.40"
  FPM_DEP2=""
  FPM_ARCH="x86_64"
fi
if [ "$1" == "pacman" ]; then
  FPM_DEPENDENCY="jre8-openjdk >= 8.u40"
  FPM_DEP2="java-openjfx"
  FPM_ARCH="all"
fi

pushd root/opt/terasology-launcher
mv TerasologyLauncher/* .
rm -rf TerasologyLauncher
popd

pushd root/usr/bin/
ln -s ../../opt/terasology-launcher/bin/TerasologyLauncher terasology-launcher
popd

cp terasology-launcher.desktop root/usr/share/applications/

fpm \
  -m "$FPM_MAINTAINER" \
  --vendor "$FPM_VENDOR" \
  --license "$FPM_LICENSE" \
  --category "$FPM_CATEGORY" \
  --url "$FPM_URL" \
  --description "TerasologyLauncher - open source voxel world, launcher." \
  --verbose \
  --log debug \
  -C root \
  -s dir \
  -t "$1" \
  -n terasology-launcher \
  -v "$buildNumber" \
  -d "$FPM_DEPENDENCY" \
  -d "$FPM_DEP2" \
  --force \
  -a "$FPM_ARCH" \
  opt \
  usr

if [ "$1" == "deb" ]; then
  if [ -z "$SIGNING" ]; then
    echo "Skipping signing."
    exit 0
  fi
  gpg --import $SIGNING
  dpkg-sig -k $KEYNAME -s builder *.deb
fi
