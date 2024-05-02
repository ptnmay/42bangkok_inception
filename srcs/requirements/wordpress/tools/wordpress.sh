#!/bin/bash

if [ ! -e "/var/www/html/wordpress/wp-config.php" ]
then

	cd /var/www/html/wordpress

	wp config create --allow-root \
			--dbname=${DB_NAME} \
			--dbuser=${DB_USER} \
			--dbpass=${DB_PASSWORD}\
			--dbhost=${DB_HOSTNAME} \
			--path='/var/www/html/wordpress'
	
	# Wait for Mariadb had to create Database !
	sleep 10
	wp core install --allow-root \
			--url=${DOMAIN_NAME} \
			--title=${WP_TITLE} \
			--admin_password=${ADMIN_PASS} \
			--admin_user=${ADMIN_USER} \
			--admin_email=${ADMIN_EMAIL}

	wp user create ${USER_USER} ${USER_EMAIL} --allow-root --user_pass=${USER_PASS} 

fi


exec "$@"
