#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

loadConfig() {
	if [ -e $SCRIPT_DIR/.env ]; then
		source $SCRIPT_DIR/.env
	else
		echo "No .env file exists in $PWD. If you want to ping healthchecks.io, please add an .env file with 'export BACKUP_UUID=<uuid>'."
	fi

	if [[ -z ${BACKUP_UUID} ]]; then
		echo "No env variable 'BACKUP_UUID' was found in $PWD/.env, please add 'export BACKUP_UUID=<uuid>' to your .env file"
	fi
}

startMessage() {
	echo "(1/7): $(date) Duplicacy is beginning an automated backup."
}

startHealthCheck() {
	echo "(2/7): $(date) Starting healthcheck.io monitoring."
	curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/${BACKUP_UUID}/start
}

backupToHDD() {
	echo "(3/7): $(date) Backing up personal data to external hard drive..."
	cd / || exit 1
	# Run duplicacy with a lock on /
	flock -en / /usr/bin/duplicacy -log backup -stats -threads 8 -storage external_hard_drive
}

backupHDDToBackblaze() {
	echo "(4/7): $(date) Backing up personal data to backblaze..."
	usr/bin/duplicacy -log copy -threads 8 -from external_hard_drive -to backblaze
}

backupTimeshiftToBackblaze() {
	echo "(5/7): $(date) Backing up timeshift data to backblaze..."
	cd /media/Backup/timeshift || 1
	/usr/bin/duplicacy -log backup -stats -threads 8 -storage backblaze
}

endHealthCheck() {
	echo "(6/7): $(date) Sending stop ping to healthcheck.io."
	curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/${BACKUP_UUID}
	unset BACKUP_UUID
}


exitMessage() {
	echo "(7/7): $(date) Finished all backups. Exiting."
}

startMessage
loadConfig
startHealthCheck
#backupToHDD
#backupHDDToBackblaze
#backupTimeshiftToBackblaze
endHealthCheck
#exitMessage
