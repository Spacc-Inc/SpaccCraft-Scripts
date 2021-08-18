#!/bin/bash

ScriptPath=$(realpath $0)
ScriptDir=$(dirname $ScriptPath)
cd $ScriptDir

ServerFolder="../../Beta-1.7.3"

echo "Pushing to git..."
cp -r "$ServerFolder/" "spacccraft-b1.7.3-backup/"
cd "spacccraft-b1.7.3-backup/" && git add . && git commit -m "New backup ($(date +"%d-%m-%y %H:%M"))" && git push
