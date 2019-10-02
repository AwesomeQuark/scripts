/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   lexer.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: conoel <conoel@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/09 15:52:03 by conoel            #+#    #+#             */
/*   Updated: 2019/04/09 17:38:43 by conoel           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "lexer.h"

t_token_def	tokens[] =
{
	{"{", 1, OPENING_BRACE},
	{"}", 1, CLOSING_BRACE},
	{"(", 1, OPENING_PARENTHESE},
	{")", 1, CLOSING_PARENTHESE},
	{"[", 1, OPENING_BRACKET},
	{"]", 1, CLOSING_BRACKET},
	{";", 1, SEMILICON},
	{"\n", 1, NEWLINE},
	{"while", 5, WHILE},
	{"for", 3, FOR},
	{"if", 2, IF},
	{"else", 4, ELSE},
	{"return", 6, RETURN},
	{"define", 6, DEFINE},
	{"include", 7, INCLUDE},
	{"or", 2, OR},
	{"and", 3, AND},
	{"++", 2, INCREMENTATION},
	{"--", 2, DECREMENTATION},
	{"+", 1, PLUS},
	{"-", 1, MINUS},
	{"/", 1, DIVIDE},
	{"*", 1, MULTIPLY},
	{"==", 2, EQUAL},
	{"=", 1, ATTRIBUTION},
	{"!=", 2, DIFFERENT},
	{"int", 3, INT},
	{"char", 4, CHAR},
	{"static", 6, STATIC},
	{" ", 1, SPACE},
	{NULL, 0, STOP}
};

static int		handle_escape(char **file)
{
	if (**file == '\\')
		return (1);
	if (ft_strncmp(*file, "\\*", 2) == 0)
	{
		while (*file && ft_strncmp(*file, "*\\", 2) != 0)
			(*file) += 1;
		return (1);
	}
	if (ft_strncmp(*file, "\"", 1) == 0)
	{
		while (*file && ft_strncmp(*file, "\"", 2) != 0)
			(*file) += 1;
		return (1);
	}
	if (ft_strncmp(*file, "\'", 1) == 0)
	{
		while (*file && ft_strncmp(*file, "\'", 2) != 0)
			(*file) += 1;
		return (1);
	}
	return (0);
}

static t_token_def	*search_token_type(char *file)
{
	size_t	i;

	i = 0;
	while (tokens[i].type != STOP)
	{
		if (ft_strncmp(file, tokens[i].content, tokens[i].size) == 0)
			return (&tokens[i]);
		i++;
	}
	return (NULL);
}

int				lexer_main_loop(char *file, t_token *head)
{
	t_token_def	*current;
	char		*last_token_found;

	while (file && *file)
	{
		if (handle_escape(&file))
		{
			file++;
			continue ;
		}
		if (!(current = search_token_type(file)))
		{
			file++;
			continue ;
		}
		if (last_token_found != file && head->next != NULL)
			add_token(last_token_found, file - last_token_found,
				misc_type(last_token_found, file - last_token_found), head);
		file += current->size;
		last_token_found = file;
		if (!(add_token(current->content, current->size, current->type, head)))
			return (0);
	}
	return (1);
}

t_token			*lexer(int fd)
{
	t_token	*head;
	char	*file;
	size_t	i;

	if (fd < 0)
		return (NULL);
	i = 0;
	if (!(file = get_the_file(fd)))
		return ((t_token *)malloc_garbage(0));
	if (!(head = malloc_garbage(sizeof(t_token))))
		return (NULL);
	head->type = START;
	head->next = NULL;
	head->size = 0;
	head->content = NULL;
	lexer_main_loop(file, head);
	return (head);
}