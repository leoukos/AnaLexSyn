%{
#include <stdio.h>
#include <string.h>

#include "utils.h"

#define YYSTYPE char *
extern YYSTYPE yylval;

void yyerror(const char * str)
{
	fprintf(stderr, "ERROR : %s\n", str);
}

int yywrap()
{
	return 1;
}

main()
{
	int t;
	print_header();
	yyparse();
	print_footer();
}
%}

%token COMPOSER MESURATION TONE STYLE TITLE PROG 
%token THEME_A_START THEME_A_STOP THEME_B_START THEME_B_STOP
%token MES PROGVAL TEXT TONEVAL CHORD SEP

%%

header: /*empty*/
	|title composer style mesuration tone prog  chords themes
	;

themes:
	|theme_a theme_b
	;

chords:
	|chords chord_line

title:
	TITLE TEXT
	{
		printf("\\begin{center}\n"
				"\\textbf{{\\huge %s}}\n"
				"\\end{center}\n\n",
				$2);
	}
	;

composer:
	COMPOSER TEXT
	{
		printf("\\begin{center}\n"
				"\\textbf{{\\large %s}}\n"
				"\\end{center}\n\n",
				$2);
	}
	;

style:
	STYLE TEXT
	{
		printf("\\begin{Large}\n"
				"Style : %s\n"
				"\\end{Large}\n\n",
				$2);
	}
	;

mesuration:
	MESURATION MES
	{
		printf("\\begin{Large}\n"
				"Mesuration : %s\n"
				"\\end{Large}\n\n",
				$2);
	}
	;

tone:
	TONE TONEVAL
	{
		printf("\\begin{Large}\n"
				"Tone : %s\n"
				"\\end{Large}\n\n",
				$2);
	}
	;

prog:
	PROG PROGVAL
	{
		printf("\\begin{Large}\n"
				"Progression : %s\n"
				"\\end{Large}\n\n",
				$2);
	}
	;

theme_a:
	theme_a_start chords theme_a_stop
	{
		printf("\n\n");
	}
	;

theme_a_start:
	THEME_A_START
	{
		printf("\\begin{huge}\n"
					"\\section*{A}\n"
					"\\begin{tabular}{|c|c|c|c|}\n"
		    		"\\hline\n");
	}
	;

theme_a_stop:
	THEME_A_STOP
	{
		printf("\\end{tabular}\n"
					"\\end{huge}\n");
	}
	;

theme_b:
	theme_b_start chords theme_b_stop
	{
		printf("\n\n");
	}
	;

theme_b_start:
	THEME_B_START
	{
		printf("\\begin{huge}\n"
					"\\section*{B}\n"
					"\\begin{tabular}{|c|c|c|c|}\n"
		    		"\\hline\n");
	}
	;

theme_b_stop:
	THEME_B_STOP
	{
		printf("\\end{tabular}\n"
					"\\end{huge}\n");
	}
	;

chord_line:
	CHORD SEP CHORD SEP CHORD SEP CHORD SEP
	{
		//printf("$\\{C}{7}$  & $\\chord{C}{7}$  & $\\chord{C}{7}$  & $\\chord{C}{7}$\\\\\n"
		//			"\\hline\n");
		printf("%s & %s & %s & %s \\\\\n"
					"\\hline\n", $1, $3, $5, $7);
	}
	;
