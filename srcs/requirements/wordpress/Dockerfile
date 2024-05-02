FROM	debian:bullseye

# System setting
RUN	apt update && apt install wget -y

# debugging
RUN	apt install vim -y

# Wordpress install
RUN	apt install php php-mysql php-fpm mariadb-client -y

RUN	wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz

RUN	mkdir -p /var/www/html && tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html

RUN	chown -R www-data:www-data /var/www/html/wordpress

RUN	chmod -R 755 /var/www/html/wordpress

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp

# Config
COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/

# Script
COPY	./tools/wordpress.sh /home/
RUN	chmod 755 /home/wordpress.sh

RUN	service php7.4-fpm start

ENTRYPOINT ["/home/wordpress.sh"]

CMD	["/usr/sbin/php-fpm7.4", "-F"]
