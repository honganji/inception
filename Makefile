SRCS_DIR := srcs

DOCKER := docker
COMPOSE := compose
DOCKER_COMPOSE_FILE := docker-compose.yml

MAKE_DIR := mkdir -p

RM_FLAG := -rf

all: start

start:
	$(MAKE_DIR) $(HOME)/data/web
	$(MAKE_DIR) $(HOME)/data/db
	$(DOCKER) $(COMPOSE) -f ./$(SRCS_DIR)/$(DOCKER_COMPOSE_FILE) up -d

down:
	$(DOCKER) $(COMPOSE) -f ./$(SRCS_DIR)/$(DOCKER_COMPOSE_FILE) down

prune:
	$(DOCKER) system prune -af

clean:
	docker system prune -af

fclean: clean
	rm -rf $(HOME)/data
	docker-compose -f ./$(SRCS_DIR)/$(DOCKER_COMPOSE_FILE) down -v --rmi all

re: fclean all

.PHONY: all start down prune clean fclean re

GREEN := \033[0;32m
BLUE := \033[0;34m
NC := \033[0m
