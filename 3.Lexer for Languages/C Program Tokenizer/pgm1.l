%{
#include <stdio.h>
%}

%start PI
%%
"int"|"float"|"if"|"else"|"for"|"while"|"include"|"return" {BEGIN 0; printf("%s is keyword\n", yytext);}

([a-zA-Z]+).h {BEGIN 0; printf("%s is a header file\n", yytext);}

"#" {BEGIN 0; printf("%s is stringize preprocessor operator\n", yytext);}

"printf"|"scanf"|"main"	{BEGIN 0; printf("%s is an in-built function\n", yytext);}

\".*\" {BEGIN 0; printf("%s is a string constant\n", yytext);}

[0-9]+ {BEGIN PI; printf("%s is a numeric constant\n", yytext);}

[a-zA-Z_][0-9a-zA-Z_]* {BEGIN PI; printf("%s is an identifier\n", yytext);}

<PI>"++" {printf("%s is an post-increment operator\n", yytext);}

"++" {printf("%s is an pre-increment operator\n", yytext);}

<PI>"--" {printf("%s is an post-decrement operator\n", yytext);}

"--" {printf("%s is an pre-decrement operator\n", yytext);}

"+" {BEGIN 0; printf("%s is addition operator\n", yytext);}

"-" {BEGIN 0; printf("%s is subtraction operator\n", yytext);}

"*" {BEGIN 0; printf("%s is multiplication operator\n", yytext);}

"/" {BEGIN 0; printf("%s is division operator\n", yytext);}

"%" {BEGIN 0; printf("%s is modulus operator\n", yytext);}

"="|"+="|"-="|"*="|"/="|"%=" {BEGIN 0; printf("%s is an assignment operator\n", yytext);}

">=" {BEGIN 0; printf("%s is greater than or equal to operator\n", yytext);}

"<=" {BEGIN 0; printf("%s is less than or equal to operator\n", yytext);}

"!=" {BEGIN 0; printf("%s is not equal operator\n", yytext);}

"==" {BEGIN 0; printf("%s is equality comparison operator\n", yytext);}

"&&" {BEGIN 0; printf("%s is a logical AND operator\n", yytext);}

"||" {BEGIN 0; printf("%s is a logical OR operator\n", yytext);}

"!" {BEGIN 0; printf("%s is a logical NOT operator\n", yytext);}

"&" {BEGIN 0; printf("%s is a BITWISE AND operator\n", yytext);}

"|" {BEGIN 0; printf("%s is a BITWISE OR operator\n", yytext);}

"^" {BEGIN 0; printf("%s is a BITWISE XOR operator\n", yytext);}

"~" {BEGIN 0; printf("%s is a BITWISE NOT operator\n", yytext);}

"<<" {BEGIN 0; printf("%s is a bitwise LEFT SHTFT operator\n", yytext);}

">>" {BEGIN 0; printf("%s is a bitwise RIGHT SHIFT operator\n", yytext);}

[(){}|,;] {BEGIN 0; printf("%s is a delimeter\n", yytext);}

\n 	{;}

\t {;}

[" " \t]+ {;}

.	{;}
%%

int yywrap()
{
return 1;
}

int main()
{
FILE *fin=fopen("input.c","r");
yyin=fin;
yylex();
}
