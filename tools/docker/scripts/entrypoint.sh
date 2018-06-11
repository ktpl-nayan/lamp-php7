#!/bin/bash
set -e

#create deployment user and set password
if [ ! -f docker_initialized ]; then
#        mkdir -p $I_DIR
        useradd -d /var/www/html -s /bin/bash $dev_user
        usermod -p $(echo $dev_user_password | openssl passwd -1 -stdin) $dev_user
        usermod -p $(echo $root_password | openssl passwd -1 -stdin) root
	chown -R $dev_user: /var/www/html
	usermod -a -G adm $dev_user
	usermod -a -G www-data $dev_user
        touch docker_initialized
fi
exec "$@"

#exec supervisord -n
