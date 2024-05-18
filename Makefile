VOLUME_DIR = ~/data

all: create up

create:
	mkdir -p ${VOLUME_DIR}/wordpress
	mkdir -p ${VOLUME_DIR}/mariadb
up:
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker exec -it wordpress sh -c "rm -rf /var/www/html/wordpress/*"
	docker exec -it mariadb sh -c "rm -rf /var/lib/mysql/*"
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	docker rmi mariadb nginx wordpress

fclean: clean
	docker system prune -af
	docker volume prune -f
	rm -rf $(VOLUME_DIR)
#	docker run --rm -v ${VOLUME_DIR}:/var/www/html/wordpress -w /app debian:bullseye rm -rf /var/www/html/*
#	docker run --rm -v ${VOLUME_DIR}:/var/lib/mysql -w /app debian:bullseye rm -rf /var/lib/mysql/*
	#docker stop $$(docker ps -qa)
#	docker system prune --all --force

.PHONY : all create up down start stop re clean fclean

