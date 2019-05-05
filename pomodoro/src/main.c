#include "pomodoro.h"

t_phase phase_definition[] =
	{
		{DEFAULT_WORK_DURATION, WORK, DEFAULT_WORK_MESSAGE},
		{DEFAULT_PAUSE_DURATION, PAUSE, DEFAULT_PAUSE_MESSAGE},
		{0, TAB_END, NULL}};

void	quit(int no)
{
	no = 0;
	printf("byebye you lazy coward\n");
	tputs(tgetstr("ve", NULL), 1, putchar);
	exit(1);
}

int		init(void)
{
	signal(SIGINT, quit);
	if (tgetent(NULL, getenv("TERM")) == -1)
		return (-1);
	tputs(tgetstr("vi", NULL), 1, putchar);
	return (1);
}

int		main(int argc, char **argv)
{
	int max_tours = DEFAULT_MAX_TOURS;
	t_phase phase_definition[] =
		{
			{DEFAULT_WORK_DURATION, WORK, DEFAULT_WORK_MESSAGE},
			{DEFAULT_PAUSE_DURATION, PAUSE, DEFAULT_PAUSE_MESSAGE},
			{0, TAB_END, NULL}};
	
	if (!init()) //			initialise everything
		return (-1);
	parse(argc, argv, phase_definition, &max_tours); //	get options
	loop(phase_definition, &max_tours);				 //				never quit until ctrl-C
}