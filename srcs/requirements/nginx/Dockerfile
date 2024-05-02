FROM debian:bullseye

# System setting
#RUN    apt update && apt upgrade -y && apt install wget -y
RUN     apt update

# debugging
RUN     apt install vim -y

# Nginx install
RUN     apt install nginx openssl -y

# SSL, TSL
RUN	mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes \
	-days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/psaeyang.key \
	-out /etc/nginx/ssl/psaeyang.crt \
	-subj "/C=TH/L=Bangkok/O=42/CN=psaeyang.42.fr"


COPY ./conf/nginx.conf /etc/nginx/conf.d/

RUN	rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
