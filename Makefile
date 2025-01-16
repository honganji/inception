SRCS_DIR := srcs

DOCKER := docker
COMPOSE := compose
DOCKER_COMPOSE_FILE := docker-compose.yml

MAKE_DIR := mkdir -p

RM_FLAG := -rf

all: start

start:
	$(DOCKER) $(COMPOSE) -f ./$(SRCS_DIR)/$(DOCKER_COMPOSE_FILE) up -d

stop:
	$(DOCKER) $(COMPOSE) -f ./$(SRCS_DIR)/$(DOCKER_COMPOSE_FILE) down

prune:
	$(DOCKER) system prune -af

.PHONY: start stop prune

GREEN := \033[0;32m
BLUE := \033[0;34m
NC := \033[0m
