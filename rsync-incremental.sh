SOURCE_BACKUP_GLOB=$1
EXCLUDE_LIST_FILE_PATH=$2
TARGET_PATH_DIR=$3
printf "\n\nStarting rsync incremental backup\n"
echo "SOURCE_BACKUP_GLOB: $SOURCE_BACKUP_GLOB"
echo "EXCLUDE_LIST_FILE_PATH: $EXCLUDE_LIST_FILE_PATH"
echo "TARGET_PATH_DIR: $TARGET_PATH_DIR"

DATE_TIME="$(date '+%Y-%m-%d_%H-%M-%S')"
LATEST_DIR_PATH="$TARGET_PATH_DIR/latest"
CURRENT_BACKUP_PATH="${TARGET_PATH_DIR}/${DATE_TIME}/"

echo "CURRENT_BACKUP_PATH: $CURRENT_BACKUP_PATH"

if [ ! -f $LATEST_DIR_PATH ]; then
    mkdir -p $LATEST_DIR_PATH
fi;

#Backup and create hardlinks to latest if files not changed
#--delete files if they are not at the source anymore
#-a archive, -v verbose, -r recursive
sudo rsync -avq \
--delete \
--include="*/" \
--exclude-from $EXCLUDE_LIST_FILE_PATH \
--exclude $TARGET_PATH_DIR \
--link-dest $LATEST_DIR_PATH \
/home/pmarkus/.??* \
$CURRENT_BACKUP_PATH

#/home/pmarkus/.[^.]* \
#/home/pmarkus/.*** \
#/path/to/dir/.??*

#Remove symlink to the latest backup
rm -rf "${LATEST_DIR_PATH}"
#if [ -f $LATEST_DIR_PATH ]; then
#    rm -rf "${LATEST_DIR_PATH}"
#fi;

echo "Link from $CURRENT_BACKUP_PATH to $LATEST_DIR_PATH"
ln -s "${CURRENT_BACKUP_PATH}" "${LATEST_DIR_PATH}"

#Create new symlink from just created backup to latest (next on will create hardlinks to this one)
#if [ -f $CURRENT_BACKUP_PATH ]; then
#    echo "Link from $CURRENT_BACKUP_PATH to $LATEST_DIR_PATH"
#    ln -s "${CURRENT_BACKUP_PATH}" "${LATEST_DIR_PATH}"
#fi;