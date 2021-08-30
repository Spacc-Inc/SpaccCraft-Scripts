#!/bin/bash

echo "SpaccCraft Server quick restore..."

apt update; apt install default-jre git wget
# apt install -y sed software-properties-common; add-apt-repository -y ppa:openjdk-r/ppa
# sed -i "s/deb/deb [trusted=yes]/" /etc/apt/sources.list.d/openjdk-r-ubuntu-ppa-impish.list
# apt update; apt install -y openjdk-8-jre git wget

mkdir -p Backup/Beta-1.7.3/
cd Backup/Beta-1.7.3/

git config --global credential.helper store
echo "https://username:password@example.com" > ~/.git-credentials
git clone --depth 1 https://gitlab.com/octospacc/spacccraft-b1.7.3-backup3.git
cd spacccraft-b1.7.3-backup3/
git config user.name "OctoSpacc SpaccCraft"
git config user.email "octospacc@gitlab.com"
cd ../

wget https://raw.githubusercontent.com/Spacc-Inc/SpaccCraft-Scripts/main/ServerBackupGit.sh
chmod +x ServerBackupGit.sh

cp -r spacccraft-b1.7.3-backup3/Beta-1.7.3/ ../../
cd ../../Beta-1.7.3/
chmod +x StartMinecraftServer.sh

echo "Restored server and backup systems!"
echo "Note: backup command line in plugins/Essentials/config.yml might need editing."
