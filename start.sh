source settings.sh

bash pkg_dumps/create-all-pkg-dumps.sh

#bash rsync-dot-home-root-backup.sh exclude_lists/minimal $TARGET_DIR_PATH

bash rsync-dot-home-root-backup.sh exclude_lists/main $TARGET_BACKUP_DIR_PATH