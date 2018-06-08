#!/bin/bash
set -e

#create deployment user and set password
if [ ! -f docker_initialized ]; then
#        mkdir -p $I_DIR
        useradd -d $dev_user_dir -s /bin/bash $dev_user -u $dev_user_id
        usermod -p $(echo $dev_user_password | openssl passwd -1 -stdin) $dev_user
        usermod -p $(echo $root_password | openssl passwd -1 -stdin) root
	chown -R $dev_user: $dev_user_dir
	usermod -a -G adm $dev_user
        touch docker_initialized
fi
exec "$@"

#exec supervisord -n
