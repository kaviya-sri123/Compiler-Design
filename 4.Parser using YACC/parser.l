%{
#include "y.tab.h"
%}
%start S
%%
"for" {return FOR;}
"if" {return IF;}
"else" {return ELSE;}
"(" {BEGIN 0; return OB;}
")" {BEGIN S; return CB;}
"{" {BEGIN 0; return OC;}
"}" {BEGIN 0; return CC;}
";" {BEGIN 0; return DELIM;}
[a-zA-Z][a-zA-Z0-9]* {BEGIN S; return ID;}
[0-9]+ {BEGIN S; return ICONST;}
[0-9]+(.)[0-9]+ {BEGIN S; return FCONST;}
"&&" {return AND;}
"||" {return OR;}
"!" {return NOT;}
"=" {BEGIN 0; return EQ;}
"+=" {BEGIN 0; return PEQ;}
"-=" {BEGIN 0; return MEQ;}
"*=" {BEGIN 0; return MUEQ;}
"/=" {BEGIN 0; return DEQ;}
"%=" {BEGIN 0; return MODEQ;}
"," {BEGIN 0; return COMMA;}
"*" {BEGIN 0; return MUL;}
"/" {BEGIN 0; return DIV;}
"%" {return MOD;}
<S>"++" {BEGIN S; return POSTINC;}
<S>"--" {BEGIN S; return POSTDEC;}
<S>"+" {BEGIN 0; return PLUS;}
<S>"-" {BEGIN 0; return SUB;}
"++" {return PREINC;}
"--" {return PREDEC;}
"+" {BEGIN 0; return POS;}
"-" {BEGIN 0; return NEG;}
"\n" ;
<<EOF>> {return EOFL;}
%%
int yywrap()
{
    return 1;
}
