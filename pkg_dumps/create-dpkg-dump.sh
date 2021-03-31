echo $(dpkg --get-selections) | sed -e "s/install /\n/g"  > libdumps/dpkg-dump-list.txt
cat `dirname $0`/libdumps/dpkg-dump-list.txt
