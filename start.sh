TARGET_DIR_PATH=/media/pmarkus/Volume/backups

bash create-lib-dumps.sh

bash create-dpkg-dump.sh


#bash rsync-dot-home-root-backup.sh exclude_lists/minimal $TARGET_DIR_PATH

bash rsync-dot-home-root-backup.sh exclude_lists/main $TARGET_DIR_PATH