#!/bin/bash

cd / || exit 1
echo "$(date) Duplicacy is beginning a backup of $PWD to the external hard drive..."
# Run duplicacy with a lock on /
flock -en / /usr/local/bin/duplicacy -log backup -stats -threads 8 -storage external_hard_drive
echo "$(date) Duplicacy finished backing up to external hard drive. Now backing up to backblaze..."
/usr/local/bin/duplicacy -log copy -threads 8 -from external_hard_drive -to backblaze
echo "$(date) Dupliacy finished backing up to backblaze"
