# If the lib binaries are in a file we do not need to back them up (just download and reinstall them)

#function createlist(){
PATH_FROM_ROOT=$1
TARGET_PATH=$2

rm $PATH_FROM_ROOT-list.txt
touch $PATH_FROM_ROOT-list.txt
echo $(ls /$PATH_FROM_ROOT) | sed -e "s/ /\n/g"  > $TARGET_PATH/$PATH_FROM_ROOT-list.txt
#}