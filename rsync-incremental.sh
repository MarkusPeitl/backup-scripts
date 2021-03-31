SOURCE_BACKUP_GLOB=$1
EXCLUDE_LIST_FILE_PATH=$2
TARGET_PATH_DIR=$3

DATE_TIME="$(date '+%Y-%m-%d_%H:%M:%S')"
LATEST_DIR_PATH="$TARGET_PATH_DIR/latest"
BACKUP_PATH="${TARGET_PATH_DIR}/${DATE_TIME}"

#Backup and create hardlinks to latest if files not changed
#--delete files if they are not at the source anymore
#-a archive, -v verbose, -r recursive
sudo rsync -avr \
--delete \
--exclude-from $EXCLUDE_LIST_FILE_PATH \
--exclude $TARGET_PATH_DIR \
$SOURCE_BACKUP_GLOB \
--link-dest $LATEST_DIR_PATH \
$BACKUP_PATH

#Remove symlink to the latest backup
rm -rf "${LATEST_DIR_PATH}"

#Create new symlink from just created backup to latest (next on will create hardlinks to this one)
ln -s "${BACKUP_PATH}" "${LATEST_LINK}"
