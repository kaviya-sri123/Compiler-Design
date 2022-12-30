%{
#include<stdio.h>
#include<string.h>
#include"y.tab.h"
%}
%start BM
%%
"+" {BEGIN 0;return PLUS;}
"*" {BEGIN 0;return MUL;}
"/" {BEGIN 0;return DIV;}
"%" {BEGIN 0;return MOD;}
<BM>"-" {BEGIN 0;return BMINUS;}
"-" {BEGIN 0;return UMINUS;}
"\=" {BEGIN 0;return EQUAL;}
"\(" {BEGIN 0;return OPEN;}
"\)" {BEGIN 0;return CLOSE;}
[a-zA-Z]+ {BEGIN BM;strcpy(yylval.name,yytext);return ID;}
[0-9]+\.[0-9]+ {BEGIN BM;strcpy(yylval.name,yytext);return FLOAT;}
[0-9]+ {BEGIN BM;strcpy(yylval.name,yytext);return INT;}
%%
int yywrap()
{
return 1;
}
