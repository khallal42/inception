#!/bin/bash

sleep 10
chmod -R 777 /var/www/html
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|' etc/php/7.4/fpm/pool.d/www.conf
cd /var/www/html/
wp core download --allow-root
wp config create --dbname=$MARIADB_NAME_DATABASE --dbuser=$NAME_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb --allow-root
wp core install --url=$DOMAINE_NAME --title="My WordPress" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSW --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PSW --allow-root
exec php-fpm7.4 -F