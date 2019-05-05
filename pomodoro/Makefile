# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: conoel <conoelstudent.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/01/10 21:14:13 by conoel            #+#    #+#              #
#    Updated: 2019/04/26 14:01:05 by conoel           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =			pomodoro
AUTEUR =		"conoel"

SRC_NAME =		main.c\
				loop.c\
				parse.c

SRC_DIR =		./src/
SRC =			${addprefix $(SRC_DIR), $(SRC_NAME)}

OBJ_NAME =		$(SRC_NAME:.c=.o)
OBJ_DIR =		./obj/
OBJ =			${addprefix $(OBJ_DIR), $(OBJ_NAME)}

HEADER_DIR =	./include/
HEADER_NAME =	pomodoro.h
HEADER =		${addprefix $(HEADER_DIR), $(HEADER_NAME)}

FLAGS =			-Werror -Wextra -O0 -g3 -fsanitize=address
CC =			clang

#################################################################################
##################################### RULES #####################################
#################################################################################

.PHONY: all clean fclean re
.SILENT:

##############################
########## GENERALS ##########
##############################

all: ./auteur $(OBJ_DIR) $(NAME) $(HEADER)

re: fclean all

clean:
	rm -rf $(OBJ_DIR)

fclean:
	rm -rf $(OBJ_DIR) $(NAME) *.dSYM
	echo "\033[31m\033[1m\033[4mCleaning\033[0m\033[31m : Everything\033[0m [$(NAME)]";

###############################
######### COMPILATION #########
###############################

$(NAME): $(OBJ)
	$(CC) $(FLAGS) $(OBJ) -o $(NAME) -I$(HEADER_DIR) -ltermcap
	echo "\n \033[1m\033[4m\033[35m\\^/ Done compiling \\^/\033[0m [$(NAME)]"
	clear

$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADER)
	$(CC) $(FLAGS) -c $< -o $@ -I$(HEADER_DIR)
	printf "\033[32m\033[1m\033[4mCompiling\033[0m\033[32m : %-30s \033[0m [$(NAME)]\n" $@


$(OBJ_DIR):
	clear
	mkdir $(OBJ_DIR)
	echo "\n>=========== * \033[32m\033[1mCreating $(NAME) obj dir\033[0m * ===========<";

./auteur:
	echo $(AUTEUR) > ./auteur
	echo "\033[32m<Created Author file>\033[0m"
