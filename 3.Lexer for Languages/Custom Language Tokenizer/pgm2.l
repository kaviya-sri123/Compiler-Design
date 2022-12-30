%{
#include <stdio.h>
%}

%start BM
%%
"If"|"Then"|"Else" {BEGIN 0;printf("%s is a Keyword\n",yytext);}
"*" {BEGIN 0;printf("%s is Multiply\n",yytext);}
"**" {BEGIN 0;printf("%s is Exponent\n",yytext);}
"=" {BEGIN 0;printf("%s is Assignment\n",yytext);}
<BM>"-" {BEGIN 0; printf("- is a Subtract\n");}
"-" {BEGIN 0;printf("- is Negate\n");}
"#"[0-9 a-z A-Z]{1,25} {BEGIN BM;printf("%s is Id\n",yytext);}
[+ -]?[0-9]{1,10} {BEGIN BM;printf("%s is Constant\n",yytext);}
%%

int yywrap()
{
return 1;
}

int main()
{
FILE *fin=fopen("input.txt","r");
yyin=fin;
yylex();
}
