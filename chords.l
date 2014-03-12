%{
#include <stdio.h>
#include "y.tab.h"
#define YYSTYPE char *
extern YYSTYPE yylval;
%}

NATURE            (Maj|maj|min|sus4|alt|aug|6|7|9|11|13|b|#|o|-|\+)
CHORD             ([A-G]{NATURE}*|%)
MES               [0-9][/][0-9]
TEXT              \"([A-z]|[ ])*\"
PROG              \"[A-B]*\"
TONEVAL           \"[A-G]\"

%%
[ ][ ]+           {}  
[\n]+             {}  
[ ]+[\n]          {}  
^[.].*[\n]+       {}  
[ \t]*[.].*[\n]   {}  

TITLE             {return TITLE;}
COMPOSER          {return COMPOSER;}
MESURATION        {return MESURATION;}
TONE              {return TONE;}
PROG              {return PROG;}
STYLE             {return STYLE;}

A\/               {return THEME_A_START;}
\\A               {return THEME_A_STOP;}
B\/               {return THEME_B_START;}
\\B               {return THEME_B_STOP;}

{MES}             {yylval=strdup(yytext);return MES;}
{PROG}            {yylval=strndup(yytext+1, strlen(yytext)-2);return PROGVAL;}
{TONEVAL}         {yylval=strndup(yytext+1, strlen(yytext)-2);return TONEVAL;}
{TEXT}            {yylval=strndup(yytext+1, strlen(yytext)-2);return TEXT;}
{CHORD}           {yylval=strdup(yytext);return CHORD;}
\|                {return SEP;}
%%
