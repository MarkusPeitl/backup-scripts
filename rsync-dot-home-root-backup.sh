$EXCLUDES_LIST_DIR=$1
$TARGET_PATH=$2


if [ -z $TARGET_PATH ]; then
    TARGET_PATH=/media/pmarkus/Volume/backups
fi;
if [ -z $TARGET_PATH ]; then
    TARGET_PATH=/media/pmarkus/Volume/backups
fi;

EXC_HIDDEN_HOME=$EXCLUDES_LIST_DIR/exclude_hidden_home.list
if [ ! -f "$EXC_HIDDEN_HOME" ]; then
    echo "File $EXC_HIDDEN_HOME not found -- exiting"
    exit 4
fi
EXC_HIDDEN_HOME=$EXCLUDES_LIST_DIR/exclude_shown_home.list
if [ ! -f "$EXC_HIDDEN_HOME" ]; then
    echo "File $EXC_HIDDEN_HOME not found -- exiting"
    exit 4
fi
EXC_HIDDEN_HOME=$EXCLUDES_LIST_DIR/exclude_root_fs.list
if [ ! -f "$EXC_HIDDEN_HOME" ]; then
    echo "File $EXC_HIDDEN_HOME not found -- exiting"
    exit 4
fi

# -------------- 3 main things to back up

#Backup hidden config files
sudo rsync -avr --exclude-from $EXCLUDES_LIST_DIR/exclude_hidden_home.list ~/.*** $TARGET_PATH/homedotfiles/

#Backup home dir
sudo rsync -avr --exclude-from $EXCLUDES_LIST_DIR/exclude_shown_home.list ~/*** $TARGET_PATH/homeshownfiles/

#Backup root
sudo rsync -avr --exclude-from $EXCLUDES_LIST_DIR/exclude_root_fs.list /*** $TARGET_PATH/rootfiles/