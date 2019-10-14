#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Installing SleepAtNight"
echo "Edit settings at: /etc/SleepAtNight.config"

cp -f ./SleepAtNight.sh /usr/bin/
cp -f ./SleepAtNight.config /etc/
cp -f ./SleepAtNight.service /lib/systemd/system/
cp -f ./SleepAtNight.service /etc/systemd/system/

chmod 644 /etc/systemd/system/SleepAtNight.service
chmod +x /usr/bin/SleepAtNight.sh

systemctl enable SleepAtNight
systemctl start SleepAtNight
