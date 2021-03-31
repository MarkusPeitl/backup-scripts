echo $(dpkg --get-selections) | sed -e "s/install /\n/g"  > libdumps/dpkg-dump-list.txt
cat libdumps/dpkg-dump-list.txt
