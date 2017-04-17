#!/bin/bash

wget http://jenkins.terasology.org/view/Launcher/job/TerasologyLauncher/lastSuccessfulBuild/artifact/build/distributions/TerasologyLauncher.zip
wget http://jenkins.terasology.org/view/Launcher/job/TerasologyLauncher/lastSuccessfulBuild/artifact/build/distributions/md5sums.txt || true
wget http://jenkins.terasology.org/view/Launcher/job/TerasologyLauncher/lastSuccessfulBuild/artifact/build/distributions/sha256sums.txt || true

sha256sum -c sha256sums.txt || true
wget http://jenkins.terasology.org/view/Launcher/job/TerasologyLauncher/lastSuccessfulBuild/artifact/build/resources/main/org/terasology/launcher/version/versionInfo.properties

unzip TerasologyLauncher.zip -d root/opt/terasology-launcher
rm TerasologyLauncher.zip
