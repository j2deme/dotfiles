#!/bin/sh
# Respaldar Sybase desde terminal
SYBASE_PATH="/sybase"
ISQL="${SYBASE_PATH}/OCS-15_0/bin/isql"
USER="sa"
DB="BDtec"
SERVER="SII"
GDRIVE_FOLDER="0BxM4flYxwR1xVk9NcDc2UUpNVEE"
TIMESTAMP=`date +%Y-%m-%d_%H-%M`
TEMP_PATH="/tmp/backup.dat"
DUMPER_PATH="/sybase/backups.sql"
BACKUPS_FOLDER="/home/sybase/Backups/"
FILE="backup_${TIMESTAMP}.dat"
BACKUP_PATH="$BACKUPS_FOLDER$FILE"
#/sybase/OCS-15_0/bin/isql -U sa -D BDtec -S SII -P
#mv /tmp/backup.dat ${BACKUPS_FOLDER}backup_`date +%Y-%m-%d_%H-%M.dat`
#dump database BDtec to "/tmp/backup.dat"
#go
#quit
$ISQL -U $USER -D $DB -S $SERVER -i $DUMPER_PATH -P
mv $TEMP_PATH $BACKUP_PATH
gzip $BACKUP_PATH
drive upload -p $GDRIVE_FOLDER -f ${BACKUP_PATH}.gz
