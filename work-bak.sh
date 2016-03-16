#!/bin/bash
#this will mirror files from local /Users/mattw/ to smb share at smb://xxx.xxx.xxx.xxx/NSD/Data/shared/NSD/Woodward
#smb://xxx.xxx.xxx.xxx/NSD/Data/shared/NSD/Woodward is mounted at /Volumes/...

DESTDIR=/Volumes/NSD/Data/shared/NSD/Woodward 
LOG=./backup.log

touch $LOG
date "+%d%b%Y::%H:%M:%S">>$LOG

if [ -e $DESTDIR ] 
then 
	echo "$DESTDIR share is mounted" >>$LOG
	rsync -arv --delete --exclude='*Other-Projects' /Users/mattw/Google\ Drive/Working $DESTDIR >>$LOG 
	rsync -arv --delete --exclude="*Admin" /Users/mattw/Documents $DESTDIR >>$LOG

else 
	echo "$DESTDIR share is not mounted" 
	echo "$DESTDIR share is not mounted" >>$LOG
fi
