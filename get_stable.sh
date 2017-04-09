#!/bin/bash

wget http://jenkins.terasology.org/job/DistroOmegaRelease/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip
wget http://jenkins.terasology.org/job/DistroOmegaRelease/lastSuccessfulBuild/artifact/distros/omega/build/distributions/md5sums.txt
wget http://jenkins.terasology.org/job/DistroOmegaRelease/lastSuccessfulBuild/artifact/distros/omega/build/distributions/sha256sums.txt

sha256sum -c sha256sums.txt

unzip TerasologyOmega.zip -d terasology
