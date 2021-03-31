EXCLUDES_LIST_DIR=$1
TARGET_PATH=$2

printf "\n\nStarting dot home root incremental backup\n"
echo "EXCLUDES_LIST_DIR: $EXCLUDES_LIST_DIR"
echo "TARGET_PATH: $TARGET_PATH"

if [ -z $EXCLUDES_LIST_DIR ]; then
    echo "No exclude lists directory defined - exiting"
    exit 4
    #EXCLUDES_LIST_DIR=exclude_lists/main
fi;
if [ -z $TARGET_PATH ]; then
    echo "No target directory defined - exiting"
    exit 4
    #TARGET_PATH=/media/pmarkus/Volume/backups
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
if [ $DOT_BACKUP = true ]; then
    echo "Backing up dotfiles to $TARGET_PATH/homedotfiles ... "
    zsh rsync-incremental.sh '/home/pmarkus/.***' $EXCLUDES_LIST_DIR/exclude_hidden_home.list $TARGET_PATH/homedotfiles
fi;


#Backup home dir
if [ $HOME_BACKUP = true ]; then
    echo "Backing up home files to $TARGET_PATH/homeshownfiles ... "
    bash rsync-incremental.sh ~/*** $EXCLUDES_LIST_DIR/exclude_shown_home.list $TARGET_PATH/homeshownfiles
fi;

#Backup root
if [ $ROOT_BACKUP = true ]; then
    echo "Backing up root files to $TARGET_PATH/rootfiles ... "
    bash rsync-incremental.sh ~/.*** $EXCLUDES_LIST_DIR/exclude_root_fs.list $TARGET_PATH/rootfiles
fi;