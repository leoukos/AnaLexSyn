%{
#include <stdio.h>
#include <string.h>

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
	yyparse();
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
	|chords chord

title:
	TITLE TEXT
	{
		printf("\tTITLE is %s\n", $2);
	}
	;

composer:
	COMPOSER TEXT
	{
		printf("\tCOMPOSER is %s\n", $2);
	}
	;

style:
	STYLE TEXT
	{
		printf("\tSTYLE is %s\n", $2);
	}
	;

mesuration:
	MESURATION MES
	{
		printf("\tMESURATION is %s\n", $2);
	}
	;

tone:
	TONE TONEVAL
	{
		printf("\tTONE is %s\n", $2);
	}
	;

prog:
	PROG PROGVAL
	{
		printf("\tPROG is %s\n", $2);
	}
	;

theme_a:
	THEME_A_START chords THEME_A_STOP
	{
		printf("\tREAD THEME\n");
	}
	;

theme_b:
	THEME_B_START chords THEME_B_STOP
	{
		printf("\tREAD THEME B\n");
	}
	;

chord:
	CHORD SEP
	{
		printf("Just read a chord : %s\n", $1);
	}
	;
