#!/bin/bash

if [ -e "root" ]; then
  rm -rf root
fi

mkdir -p root/opt
mkdir -p root/usr/bin
mkdir -p root/usr/share/applications
