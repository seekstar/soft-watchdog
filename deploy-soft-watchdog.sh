#/usr/bin/env bash

set -e

sudo cp soft-watchdog /usr/local/bin/

if [ -d /etc/supervisor/conf.d/ ]; then
	conf_name="/etc/supervisor/conf.d/soft-watchdog.conf"
elif [ -d /etc/supervisord.d/ ]; then
	conf_name="/etc/supervisord.d/soft-watchdog.ini"
else
	echo Supervisor configuration directory not found!
	exit
fi
sudo bash -c "sed \"s,__food_path__,$HOME/.soft-watchdog-food,g\" soft-watchdog.conf > $conf_name"
echo Supervisor configuration saved to $conf_name
sudo supervisorctl update soft-watchdog

