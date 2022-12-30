%{
#include<stdio.h>
int cc=0,wc=1,lc=1;
%}

%%
[\n] {lc++;cc++;wc++;}
[" " \t]+ {wc++;cc=cc+yyleng;}
. {cc++;}
%%

int yywrap()
{
return 1;
}

int main()
{
FILE *fp;
fp=fopen("input.txt","r");
yyin=fp;
yylex();
printf("Number of lines = %d\n", lc); 
printf("Number of characters = %d\n", cc);
printf("Number of words = %d\n", wc);
}
