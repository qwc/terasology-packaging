#!/bin/bash

wget http://jenkins.terasology.org/job/DistroOmega/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip
wget http://jenkins.terasology.org/job/DistroOmega/lastSuccessfulBuild/artifact/distros/omega/build/distributions/sha256sums.txt
wget http://jenkins.terasology.org/job/DistroOmega/lastSuccessfulBuild/artifact/distros/omega/build/distributions/md5sums.txt

sha256sum -c sha256sums.txt
# get version information
wget http://jenkins.terasology.org/job/Terasology/lastSuccessfulBuild/artifact/build/resources/main/org/terasology/version/versionInfo.properties

# unzip to directory to be able to provide additional data/information
unzip TerasologyOmega.zip -d terasology
