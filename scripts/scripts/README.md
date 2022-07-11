# Scripts

## Duplicacy
The `duplicacy_backup.sh` script uses healthcheck.io to monitor the script (which is run by cron). In order for the healthcheck.io monitoring to work, you must setup a "project" on healthcheck.io, and then create the following `.env` file where the script is located.

```sh
# .env

export BACKUP_UUID=<uuid>
```

My current `/var/spool/cron/root`  looks like

```sh
0 4 * * * /bin/sh /home/hgducharme/scripts/duplicacy_backup.sh >> /var/log/duplicacy_backup.log

```
