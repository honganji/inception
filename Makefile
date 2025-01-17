name = inception

all : build

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

status:
	docker-compose -f ./srcs/docker-compose.yml ps

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker system prune -af
	
fclean: clean
	docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

re: fclean all

.PHONY: all build stop start status down clean fclean re
