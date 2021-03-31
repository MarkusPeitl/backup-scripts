#3 main things to back up

#TARGET_PATH=$1
$TARGET_PATH=/media/pmarkus/Volume/backups


EXCLUDES_LIST_DIR=/home/pmarkus/backups/exclude_lists

#Backup hidden config files
sudo rsync -avr --exclude-from $EXCLUDES_LIST_DIR/exclude_hidden_home.list /home/pmarkus/.*** $TARGET_PATH/homedotfiles/

#Backup home dir
sudo rsync -avr --exclude-from $EXCLUDES_LIST_DIR/exclude_shown_home.list /home/pmarkus/*** $TARGET_PATH/homeshownfiles/

#Backup root
sudo rsync -avr --exclude-from $EXCLUDES_LIST_DIR/exclude_root_fs.list /*** $TARGET_PATH/rootfiles/