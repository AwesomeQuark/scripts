/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: conoel <conoel@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/08 15:34:59 by conoel            #+#    #+#             */
/*   Updated: 2019/04/09 17:39:34 by conoel           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libc.h>
#include "../haflib/includes/garbage.h"
#include "lexer.h"

int		main(int argc, char **argv)
{
 	int		fd;
	t_token	*head;

	if (argc != 2)
	{
		dprintf(2, "Usage: norminette [file].\n");
		return (0);
	}
	fd = open(argv[1], O_RDONLY);
	head = lexer(fd);
	head = head->next;
	while (head != NULL)
	{
		printf("[\"%s\033[0m\"(%u)]  ", head->content, head->type);
		head = head->next;
	}
	malloc_garbage(0);
}