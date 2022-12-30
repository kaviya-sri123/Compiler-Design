%{
#include <stdio.h>
#include "y.tab.h"
%}
%start BM
%%
"\n" {return NL;}
"+" {BEGIN 0; return PLUS;}
"*" {BEGIN 0; return MUL;}
"/" {BEGIN 0; return DIV;}
<BM>"-" {BEGIN 0; return BMINUS;}
"-" {BEGIN 0; return UMINUS;}
"\(" {BEGIN 0; return OPEN;}
"\)" {BEGIN 0; return CLOSE;}
[0-9]+\.[0-9]+ {BEGIN BM; yylval.fval=atof(yytext); return FLOAT;}
[0-9]+ {BEGIN BM; yylval.ival=atoi(yytext); return INT;}
%%
int yywrap()
{
	return 1;
}
