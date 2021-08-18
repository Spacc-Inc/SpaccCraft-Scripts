#!/bin/bash

echo "SpaccCraft Server quick restore..."

apt update && apt install -y software-properties-common && add-apt-repository -y ppa:openjdk-r/ppa
apt update && apt install -y openjdk-8-jre git wget

mkdir -p Backup/Beta-1.7.3/
cd Backup/Beta-1.7.3/

git config --global credential.helper store
git clone --depth 1 https://gitlab.com/octospacc/spacccraft-b1.7.3-backup.git
cd spacccraft-b1.7.3-backup/
git config user.name "OctoSpacc SpaccCraft"
git config user.email "octospacc@gitlab.com"
cd ../

wget https://raw.githubusercontent.com/Spacc-Inc/SpaccCraft-Scripts/main/ServerBackupGit.sh
chmod +x ServerBackupGit.sh

cp -r spacccraft-b1.7.3-backup/Beta-1.7.3/ ../../
cd ../../Beta-1.7.3/
chmod +x StartMinecraftServer.sh

echo "Restored server and backup systems!"
echo "Note: backup command line in plugins/Essentials/config.yml might need editing."
