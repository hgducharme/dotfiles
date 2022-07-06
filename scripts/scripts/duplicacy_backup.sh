#!/bin/bash

cd / || exit 1

echo "(1/5): $(date) Duplicacy is beginning an automated backup. Backing up personal data to external hard drive..."
# Run duplicacy with a lock on /
flock -en / /usr/bin/duplicacy -log backup -stats -threads 8 -storage external_hard_drive
echo "(2/5): $(date) Backing up /media/Backup/Manjaro/duplicacy/ to backblaze..."
/usr/bin/duplicacy -log copy -threads 8 -from external_hard_drive -to backblaze
echo "(3/5): $(date) Finished backing up personal data to backblaze. Moving to timeshift data..."

cd /media/Backup/timeshift || 1
echo "(4/5): $(date) Backing up $PWD to backblaze..."
/usr/bin/duplicacy -log backup -stats -threads 8 -storage backblaze
echo "(5/5): $(date) Finished backing up $PWD to backblaze"
