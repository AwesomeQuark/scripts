/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   lexer.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: conoel <conoel@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/07 17:14:29 by conoel            #+#    #+#             */
/*   Updated: 2019/04/09 21:18:12 by conoel           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LEXER_H
# define LEXER_H

# include "../haflib/includes/haflib.h"

typedef enum
{
	START,
	OPENING_BRACE, // Control symbols
	CLOSING_BRACE,
	OPENING_PARENTHESE,
	CLOSING_PARENTHESE,
	OPENING_BRACKET,
	CLOSING_BRACKET,
	SEMILICON,
	NEWLINE,
	WHILE,         // Control structures name
	FOR,
	IF,
	ELSE,
	RETURN,
	DEFINE,        // Preprocessing
	INCLUDE,
	OR,            // Operators
	AND,
	INCREMENTATION,
	DECREMENTATION,
	PLUS,
	MINUS,
	DIVIDE,
	MULTIPLY,
	EQUAL,
	ATTRIBUTION,
	DIFFERENT,
	INT,           // Types keywords
	CHAR,
	STATIC,
	SPACE,
	MISC_STRING,    // Variable and function names
	MISC_INT,
	STOP
} t_token_type;

typedef struct s_token_def
{
	char*			content;
	size_t			size;
	t_token_type	type;
}				t_token_def;

typedef struct s_token
{
	struct s_token	*next;
	char*			content;
	size_t			size;
	t_token_type	type;
}				t_token;

t_token			*lexer(int fd);
int				add_token(char *content, size_t size, t_token_type type, t_token *head);
t_token_type	misc_type(char *str, size_t size);

#endif