# Mariadb
FROM    debian:bullseye

# System setting
RUN     apt update

# debugging
RUN     apt install vim -y

# Mariadb install
RUN     apt install mariadb-server -y

RUN     mkdir -p /var/run/mysqld && \
        chown -R mysql:mysql /var/run/mysqld && \
        chmod -R 777 /var/run/mysqld

# Script
COPY    ./tools/mariadb.sh /home/

# Config
COPY    ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN     chmod 755 /home/mariadb.sh

ENTRYPOINT ["/home/mariadb.sh"]
#CMD    ["tail" , "-f"]
CMD     ["mysqld"]
