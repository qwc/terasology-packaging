#!/bin/bash

if [ -z "$KEYNAME" ]; then
  exit 1
fi

REPO=/srv/http/terasology.mmo.to/deb

{
  find . -name '*.deb' -exec cp -u -v '{}' $REPO/ \;
  pushd $REPO/
  find . -iname '*unstable*.deb' -mtime +7 -exec rm {} \;
  apt-ftparchive packages . > Packages
  bzip2 -kf Packages

  apt-ftparchive release . > Release
  gpg --yes -abs -u $KEYNAME -o Release.gpg Release
  popd
}
