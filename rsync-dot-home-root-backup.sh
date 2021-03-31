$EXCLUDES_LIST_DIR=$1
$TARGET_PATH=$2

if [ -z $EXCLUDES_LIST_DIR ]; then
    EXCLUDES_LIST_DIR=exclude_lists/main
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

CURRENT_TIME="$(date '+%Y-%m-%d_%H:%M:%S')"
BACKUP_PATH="${TARGET_PATH}/${CURRENT_TIME}"

# -------------- 3 main things to back up

#Backup hidden config files
if [ $DOT_BACKUP ]; then
    bash rsync-incremental.sh ~/.*** $EXCLUDES_LIST_DIR/exclude_hidden_home.list $TARGET_PATH/homedotfiles
fi;


#Backup home dir
if [ $HOME_BACKUP ]; then
    bash rsync-incremental.sh ~/*** $EXCLUDES_LIST_DIR/exclude_shown_home.list $TARGET_PATH/homeshownfiles
fi;

#Backup root
if [ $ROOT_BACKUP ]; then
    bash rsync-incremental.sh ~/.*** $EXCLUDES_LIST_DIR/exclude_root_fs.list $TARGET_PATH/rootfiles
fi;