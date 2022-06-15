#/usr/bin/env bash

set -e

if [ ! $1 ]; then
	echo Usage: $0 host-name
	exit
fi

mkdir -p ~/.local/bin
cp feeder ~/.local/bin/soft-watchdog-feeder

if [ -d /etc/supervisor/conf.d/ ]; then
	conf_name="/etc/supervisor/conf.d/soft-watchdog-feeder-$1.conf"
elif [ -d /etc/supervisord.d/ ]; then
	conf_name="/etc/supervisord.d/soft-watchdog-feeder-$1.ini"
else
	echo Supervisor configuration directory not found!
	exit
fi
sudo bash -c "sed \"s,__whoami__,$USER,g\" feeder.conf | sed \"s,__HOME__,$HOME,g\" | sed \"s,__hostname__,$1,g\" > $conf_name"
echo Supervisor configuration saved to $conf_name
sudo supervisorctl update soft-watchdog-feeder-$1

