%{
#include<stdio.h>
int flag=0;
%}

%%
[0-9][0-9][B M]"CS"[0-9][0-9][0-9] {flag=1;}
"\n" return 0;
%%

int yywrap()
{
return 1;
}

int main()
{
printf("Enter roll number: ");
yylex();
if(flag==1) printf("\nRoll Number matched.\n");
else printf("\nRoll Number not matched.\n");
return 0;
}
