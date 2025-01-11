NAME := Inception

SRCS_DIR := srcs
HEADER_DIR := $(SRCS_DIR)/includes
WORDPRESS_DIR := $(SRCS_DIR)/wordpress
OBJ_DIR := objs
OBJS_DIR := $(OBJ_DIR) $(addprefix $(OBJ_DIR)/, $(WORDPRESS_DIR))

# HEADERS := $(addprefix $(HEADER_DIR)/, cub3d.h parsing.h utils.h)

SOURCE := $(addprefix $(WORDPRESS_DIR)/, main.c)

OBJS := $(SOURCE:%.c=$(OBJ_DIR)/%.o)

RM := rm
CC := cc
MAKE := make
MAKE_DIR := mkdir -p

RM_FLAG := -rf
CC_FLAG := -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJS) $(HEADERS)
	$(CC) $(CC_FLAG) $(OBJS) -o $(NAME)
	@echo "$(GREEN)Build successfully!$(NC)"

clean:
	@$(RM) $(RM_FLAG) $(OBJ_DIR) $(LIBFT_DIR)/objs
	@echo "$(GREEN)Clean bins successfully!$(NC)"

fclean: clean
	@$(RM) $(RM_FLAG) $(NAME)
	@echo "$(GREEN)Clean everything successfully!$(NC)"

re: fclean all

start:
	docker compose up --build

$(OBJ_DIR)/%.o: %.c $(HEADERS)
	@$(MAKE_DIR) $(dir $@)  # Create the directory for the object file if it doesn't exist
	$(CC) $(CC_FLAG) -c $< -o $@ $(LINK_HEADERS)

$(OBJ_DIR):
	@echo "$(BLUE)Start compiling...$(NC)"
	$(MAKE_DIR) $(OBJS_DIR)

.PHONY: all clean fclean re

GREEN := \033[0;32m
BLUE := \033[0;34m
NC := \033[0m
