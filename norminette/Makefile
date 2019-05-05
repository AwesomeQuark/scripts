# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: conoel <conoel@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/01/10 21:14:13 by conoel            #+#    #+#              #
#    Updated: 2019/04/09 16:37:55 by conoel           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = norminette
HEADER_DIR = ./include/
AUTEUR = "conoel\n"

SRC_NAME =	main.c\
			lexer.c\
			lexer_token_manipulation.c

SRCDIR = ./src/
SRC = ${addprefix $(SRCDIR), $(SRC_NAME)}

OBJ_NAME = $(SRC_NAME:.c=.o)
OBJDIR = ./obj/
OBJ = ${addprefix $(OBJDIR), $(OBJ_NAME)}

LIB_NAME = haflib.a
LIB_DIR = ./haflib/
LIB = ${addprefix $(LIB_DIR), $(LIB_NAME)}

FLAGS = -Wall -Werror -Wextra
CC = clang

#################################################################################
##################################### RULES #####################################
#################################################################################

########## GENERALS ##########

all: $(LIB) $(OBJDIR) $(NAME)

re: fclean all

clean:
	@rm -rf $(OBJDIR) *.dSYM
	@make clean -C $(LIB_DIR)

fclean:
	@make fclean -C $(LIB_DIR)
	@rm -rf $(OBJDIR) $(NAME)
	@echo "\033[31m\033[1m\033[4mCleaning\033[0m\033[31m : Everything\033[0m [$(NAME)]";

######### COMPILATION #########

$(NAME): ./auteur $(LIB) $(OBJDIR) $(OBJ) $(HEADER)
	@$(CC) $(FLAGS) $(OBJ) $(LIB) -o $(NAME)
	@echo "\n \033[1m\033[4m\033[35m\\^/ Done compilate \\^/\033[0m [$(NAME)] --> $(LIB_NAME)"

$(OBJDIR):
	@clear
	@mkdir $(OBJDIR)
	@echo "\n>=========== * \033[32m\033[1mCreating $(NAME) obj dir\033[0m * ===========<";

$(OBJDIR)%.o: $(SRCDIR)%.c $(HEADER)
	@$(CC) $(FLAGS) -c $< -o $@ -I$(HEADER_DIR)
	@printf "\033[32m\033[1m\033[4mCompilating\033[0m\033[32m : %-30s \033[0m [$(NAME)]\n" $@

./auteur:
	@echo $(AUTEUR) > ./auteur
	@echo "\033[32m<Created Author file>\033[0m"

############# LIB #############

$(LIB):
	@make -C $(LIB_DIR)

.PHONY: all clean fclean re $(LIB)