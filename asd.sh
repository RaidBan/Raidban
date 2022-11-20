#!/bin/bash

mkdir /var/log/path

ls -R ~ > /var/log/path/list

gzip /var/log/path/list

ls /dev | grep sd > /var/log/path/1

echo 'Вставьте флешку и нажмине ENTER'

if read
then
ls /dev | grep sd > /var/log/path/2
fi

diff /var/log/path/1 /var/log/path/2 | grep sd | grep 1 > /var/log/path/diff
cat /var/log/path/diff
path=$( cut -c 3-6 /var/log/path/diff )

mkdir /mnt/1
echo $path
mount /dev/$path /mnt/1
cp /var/log/path/list.gz /mnt/1
rm -rf /var/log/path

echo 'Готово'


