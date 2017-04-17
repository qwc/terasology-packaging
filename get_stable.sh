#!/bin/bash

wget http://jenkins.terasology.org/job/DistroOmegaRelease/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip
wget http://jenkins.terasology.org/job/DistroOmegaRelease/lastSuccessfulBuild/artifact/distros/omega/build/distributions/md5sums.txt
wget http://jenkins.terasology.org/job/DistroOmegaRelease/lastSuccessfulBuild/artifact/distros/omega/build/distributions/sha256sums.txt

echo "Checking sha256sum..."
sha256sum -c sha256sums.txt
# get version information
wget http://jenkins.terasology.org/job/TerasologyStable/lastSuccessfulBuild/artifact/build/resources/main/org/terasology/version/versionInfo.properties

unzip TerasologyOmega.zip -d root/opt/terasology
rm TerasologyOmega.zip
