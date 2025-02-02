SRCS_DIR := srcs
HOME_DIR := /home/ytoshihi

DOCKER := docker
COMPOSE := compose
DOCKER_COMPOSE_FILE := docker-compose.yml

MAKE_DIR := mkdir -p

RM_FLAG := -rf

all: start

start:
	$(MAKE_DIR) $(HOME_DIR)/data/web
	$(MAKE_DIR) $(HOME_DIR)/data/db
	$(DOCKER) $(COMPOSE) -f ./$(SRCS_DIR)/$(DOCKER_COMPOSE_FILE) up -d

down:
	$(DOCKER) $(COMPOSE) -f ./$(SRCS_DIR)/$(DOCKER_COMPOSE_FILE) down

prune:
	$(DOCKER) system prune -af

remove:
	$(DOCKER) stop $(shell docker ps -aq)
	$(DOCKER) rm $(shell docker ps -aq)
	$(DOCKER) rmi $(shell docker images -q)

check:
	$(DOCKER) ps -a
	$(DOCKER) images

clean:
	$(DOCKER) system prune -af

fclean: clean
	rm -rf $(HOME_DIR)/data
	docker-compose -f ./$(SRCS_DIR)/$(DOCKER_COMPOSE_FILE) down -v --rmi all

re: fclean all

.PHONY: all start down prune remove clean fclean re

GREEN := \033[0;32m
BLUE := \033[0;34m
NC := \033[0m
