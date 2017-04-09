#!/bin/bash

#wget http://jenkins.terasology.org/view/Launcher/job/TerasologyLauncher/lastSuccessfulBuild/artifact/build/distributions/TerasologyLauncher.zip
#wget http://jenkins.terasology.org/view/Launcher/job/TerasologyLauncher/lastSuccessfulBuild/artifact/build/distributions/md5sums.txt
#wget http://jenkins.terasology.org/view/Launcher/job/TerasologyLauncher/lastSuccessfulBuild/artifact/build/distributions/sha256sums.txt

#sha256sum -c sha256sums.txt
wget http://jenkins.terasology.org/view/Launcher/job/TerasologyLauncher/lastSuccessfulBuild/artifact/build/resources/main/org/terasology/launcher/version/versionInfo.properties

unzip TerasologyLauncher.zip
