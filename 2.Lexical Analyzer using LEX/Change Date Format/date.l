%{
#include<stdio.h>
#include<string.h>
%}

%%
[0-3][0-9]"/"[0-1][0-9]"/"[0-9][0-9][0-9][0-9] {
    char month[4]="";
    if(yytext[3]=='0' && yytext[4]=='1')
        strcat(month,"JAN");
    else if(yytext[3]=='0' && yytext[4]=='2')
        strcat(month,"FEB");
    else if(yytext[3]=='0' && yytext[4]=='3')
        strcat(month,"MAR");
    else if(yytext[3]=='0' && yytext[4]=='4')
        strcat(month,"APR");
    else if(yytext[3]=='0' && yytext[4]=='5')
        strcat(month,"MAY");
    else if(yytext[3]=='0' && yytext[4]=='6')
        strcat(month,"JUN");
    else if(yytext[3]=='0' && yytext[4]=='7')
        strcat(month,"JUL");
    else if(yytext[3]=='0' && yytext[4]=='8')
        strcat(month,"AUG");
    else if(yytext[3]=='0' && yytext[4]=='9')
        strcat(month,"SEP");
    else if(yytext[3]=='1' && yytext[4]=='0')
        strcat(month,"OCT");
    else if(yytext[3]=='1' && yytext[4]=='1')
        strcat(month,"NOV");
    else
        strcat(month,"DEC");
    fprintf(yyout,"%c%c %s %c%c%c%c",yytext[0],yytext[1],month,yytext[6],yytext[7],yytext[8],yytext[9]);}
%%

int yywrap()
{
return 1;
}
int main()
{
FILE *fp1,*fp2;
fp1=fopen("input.txt","r");
yyin=fp1;
fp2=fopen("output.txt","w");
yyout=fp2;
yylex();
}
