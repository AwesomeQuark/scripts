#include "pomodoro.h"

static void	usage(void)
{
	dprintf(2, "Usage: pomodoro [-work duration] [-pause duration] [-tours number]\n");
	quit(0);
}

void parse(int argc, char **argv, t_phase *phase_definition, int *max_tours)
{
	int i = 1;

	if (argc == 1)
		return ;
	while (i < argc)
	{
		if (strcmp("-work", argv[i]) == 0)
		{
			if (i + 1 == argc)
				usage();
			phase_definition[0].duration = atoi(argv[++i]) * 60;
			i++;
			continue ;
		}
		else if (strcmp("-pause", argv[i]) == 0)
		{
			if (i + 1 == argc)
				usage();
			phase_definition[1].duration = atoi(argv[++i]) * 60;
			i++;
			continue;
		}
		else if (strcmp("-tours", argv[i]) == 0)
		{
			if (i + 1 == argc)
				usage();
			*max_tours = atoi(argv[++i]);
			i++;
			continue;
		}
		else
			usage();
	}
}