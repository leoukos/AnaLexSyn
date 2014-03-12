#include "utils.h"

void print_header()
{
	system("cat header.tex");
}

void print_footer()
{
	printf("\\clearpage\n\\end{document}\n");
}
