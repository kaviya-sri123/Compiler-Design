%{
#include<stdio.h>
#include<string.h>
#include"y.tab.h"
%}
%START BM
%%
"if" {return IF;}
"while" {return WHILE;}
"then" {return THEN;}
"do" {return DO;}
"=" {BEGIN 0;return EQ;}
";" {BEGIN 0;return SC;}
"+" {BEGIN 0;return ADD;}
"*" {BEGIN 0;return MUL;}
"/" {BEGIN 0;return DIV;}
"(" {BEGIN 0;return OB;}
")" {BEGIN BM;return CB;}
"<" {return LT;}
">" {return GT;}
">=" {return GE;}
"<=" {return LE;}
"!=" {return NE;}
"==" {return EQU;}
"&&" {return AND;}
"||" {return OR;}
<BM>"-" {BEGIN 0; return SUB;}
"-" {BEGIN 0; return UM;}
[a-zA-Z0-9]* {BEGIN BM;
    strcpy(yylval.name,yytext);
    return ID;
    }