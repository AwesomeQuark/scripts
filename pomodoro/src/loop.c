#include "pomodoro.h"

void loop(t_phase *phase_definition, int *max_tours)
{
	time_t start = 0;
	time_t end = 0;
	time_t actual = 0;
	size_t i = 0;
	int tour_counter = 0;

	while (1)
	{
		if (tour_counter >= *max_tours)
			quit(0);
		start = time(NULL);
		end = start + phase_definition[i].duration;
		tputs(tgetstr("cl", NULL), 1, putchar);
		printf("%s\n", phase_definition[i].message);
		while ((actual = time(NULL)) < end)
		{
			printf("\033[1m\033[4mRemaining:\033[0m \033[1m\033[31m%02ld:%02ld\033[0m\r", (end - actual) / 60, (end - actual) % 60);
			fflush(0);
			sleep(1);
		}
		if (phase_definition[i].type == TAB_END)
		{
			tour_counter++;
			i = 0;
		}
		else
			i++;
	}
}