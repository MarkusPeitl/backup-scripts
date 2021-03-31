sudo rdiff-backup --include-regexp "\/.+\/\..+" --exclude "/home/pmarkus/backups/***" --exclude "/***" "/" "/home/pmarkus/backups/hiddenfiles"

sudo rdiff-backup --include "/**.mp4" --include "/**.aac" --include "/**.mp3" --include "/**.flac" --include "/**.wav" --include "/**.WAV" --include "/**.MP4" --include "/**.mpv" --include "/**.mov" --include "/**.png" --include "/**.jpg" --include "/**.jpeg" --include "/**.JPG" --include "/**.PNG" --exclude "/home/pmarkus/backups/***" --exclude "/***" "/" "/home/pmarkus/backups/media"



sudo rdiff-backup --include-regexp '\/\..+' --exclude '/home/pmarkus/backups/***' --exclude "/***" --force / '/home/pmarkus/backups/hiddenfiles'


sudo rdiff-backup --include '/**/.??*' --exclude '/home/pmarkus/backups/***' --exclude "/***" --force / '/home/pmarkus/backups/hiddenfiles'






sudo rdiff-backup --include '**/.**' --exclude '/home/pmarkus/backups/***' --exclude "**" --force / '/home/pmarkus/backups/hiddenfiles'

sudo rdiff-backup --include '/home/pmarkus/.*' --exclude '/home/pmarkus/backups/***' --exclude "/home/pmarkus/**" --force /home/pmarkus '/home/pmarkus/backups/hiddenfiles'



sudo rdiff-backup --include '/home/pmarkus/.*' --exclude '/home/pmarkus/backups/***' --exclude "/home/pmarkus/**" --force /home/pmarkus '/home/pmarkus/backups/hiddenfiles'


sudo rdiff-backup --include '/home/pmarkus/.wine/.*' --exclude "/home/pmarkus/.wine/**" --force /home/pmarkus/.wine '/home/pmarkus/backups/hiddenfiles'


sudo rsync --include '/home/pmarkus/.wine/.*' --exclude "/home/pmarkus/.wine/**" /home/pmarkus/.wine '/home/pmarkus/backups/hiddenfiles'

sudo rsync --exclude "/home/pmarkus/.wine/**" --include '/home/pmarkus/.wine/.*' /home/pmarkus/.wine '/home/pmarkus/backups/hiddenfiles'



sudo rsync /home/pmarkus/.wine/ /home/pmarkus/backups/hiddenfiles/ -vrn --include "/.*sdgsdg" 


#sudo rsync -avrn --include "*07*" --exclude "*2021*" /home/pmarkus/**/*.mp4 /home/pmarkus/backups/hiddenfiles/

#sudo rsync -avrn --include "*07*" --exclude "*" /home/pmarkus/.*** /home/pmarkus/backups/hiddenfiles/

sudo rsync -avrn --exclude ".cache/***"  --exclude ".nvm/***" --exclude ".config/Code/***" --exclude ".local/share/icons/***"  --exclude ".wine/***" --exclude ".steam/***" --exclude ".local/share/Trash/***" --exclude ".vscode/***" --exclude "backups/***"  /home/pmarkus/.*** /home/pmarkus/backups/homedotfiles/



sudo rsync -avrn --exclude ".wine/***" --exclude "Downloads/***" --exclude "miniconda3/***" --exclude "repos/***" --exclude "Downloads/***"  /home/pmarkus/*** /home/pmarkus/backups/homedotfiles/

sudo rsync -avrn /home/pmarkus/.** /home/pmarkus/backups/hiddenfiles/


#Include is only working when exclude and include are working on the same directory level (if a directory up the tree was already excluded -> include ignored)



#Backup hidden config files
sudo rsync -avrn --exclude-from /home/pmarkus/backups/exclude_hidden_home.list /home/pmarkus/.*** /media/pmarkus/Volume/backups/homedotfiles/

#Backup home dir
sudo rsync -avrn --exclude-from /home/pmarkus/backups/exclude_shown_home.list /home/pmarkus/*** /media/pmarkus/Volume/backups/homeshownfiles/

#Backup root
sudo rsync -avrn --exclude-from /home/pmarkus/backups/exclude_root_fs.list /*** /media/pmarkus/Volume/backups/rootfiles/